local function setup_colors(theme)
    vim.cmd.colorscheme(theme)

    local utils = require("he.utils")

    local toclear = {
        "Normal",
        "NormalFloat",
        "DiagnosticVirtualTextHint",
        "DiagnosticVirtualTextOk",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextWarn",
        "DiagnosticVirtualTextError",
        "TelescopeNormal",
        "TelescopeBorder",
        "NonText",
    }

    -- utils:clear_group(toclear)
end

vim.g.setup_colors = setup_colors

return {
    {
        "craftzdog/solarized-osaka.nvim",
        priority = 1000,
        opts = {
            -- transparent = true
        },
    },
    {
        "samharju/serene.nvim",
        -- for using as main:
        --config = function() vim.cmd.colorscheme("serene") end,
    },
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            tweak_background = {
                normal = "none", -- main background
                telescope = "none", -- telescope
                menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
                popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
            },
        },
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                -- optional configuration here
                transparent = true,
                style = {
                    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                    boolean = "none",
                    number = "none",
                    float = "none",
                    error = "none",
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    headings = "bold",
                    operators = "none",
                    strings = "none",
                    variables = "none",

                    -- keywords
                    keywords = "none",
                    keyword_return = "none",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",

                    -- builtin
                    builtin_constants = "none",
                    builtin_functions = "none",
                    builtin_types = "none",
                    builtin_variables = "none",
                },
                colors = {
                    func = "#bc96b0",
                    keyword = "#787bab",
                    -- string = "#d4bd98",
                    string = "#8a739a",
                    -- string = "#f2e6ff",
                    -- number = "#f2e6ff",
                    -- string = "#d8d5b1",
                    number = "#8f729e",
                    -- type = "#dcaed7",
                },
            })
        end,
        priority = 1000,
    },
}
