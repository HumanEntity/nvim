return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { enabled = false },
        },
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                symbol = "│",
                options = { try_as_border = true },
            })
        end,
    },
}
