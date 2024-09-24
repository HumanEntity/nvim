return {
    "folke/trouble.nvim",
    event = "LspAttach",
    tag = "v2.10.0",
    config = function()
        require("trouble").setup({
            icons = false,
        })
        vim.keymap.set("n", "<leader>tt", function()
            require("trouble").toggle("diagnostics")
        end)

        vim.keymap.set("n", "[t", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)

        vim.keymap.set("n", "]t", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end,
}
