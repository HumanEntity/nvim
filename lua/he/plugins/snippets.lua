return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")
            ls.setup()

            local s = ls.snippet
            local sn = ls.snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node
            local r = ls.restore_node
            local fmt = require("luasnip.extras.fmt").fmt

            local reg_languages = { "c", "cpp", "rust", "arduino" }

            for _, lang in pairs(reg_languages) do
                ls.add_snippets(lang, {
                    s("reg", {
                        t({ "//////////////////////////////", "/// REG" }),
                        t(": "),
                        i(0),
                    }),
                })
            end

            require("luasnip.loaders.from_vscode").lazy_load()
            ls.filetype_extend("javascript", { "jsdoc" })
            ls.filetype_extend("rust", { "rustdoc" })
            ls.filetype_extend("c", { "cdoc" })

            vim.keymap.set({ "i" }, "<C-s>e", function()
                ls.expand()
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-s>;", function()
                ls.jump(1)
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>,", function()
                ls.jump(-1)
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}
