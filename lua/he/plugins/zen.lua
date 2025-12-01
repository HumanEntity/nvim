return {
    {
        "folke/zen-mode.nvim",
        lazy = false,
        opts = {
            window = {
                backdrop = 1,
                options = {
                    number = false, -- disable number column
                    relativenumber = false,
                },
            },
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = true,
    },
    -- Lua
    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        event = "VeryLazy",
        config = function()
            require("twilight").setup({
                context = 10,
                treesitter = true,
                dimming = {
                    alpha = 0.35,
                },
            })
            -- Dim everything when inserting to force using normal mode
            -- vim.api.nvim_create_autocmd("InsertEnter", {
            --     -- command = ":TwilightEnable",
            --     callback = function()
            --         require("twilight").setup({
            --             context = -1,
            --             treesitter = true,
            --         })
            --     end,
            --     group = "HeGroup",
            -- })
            --
            -- vim.api.nvim_create_autocmd("InsertLeave", {
            --     -- command = ":TwilightDisable",
            --     callback = function()
            --         require("twilight").setup({
            --             context = 5,
            --             treesitter = true,
            --         })
            --     end,
            --     group = "HeGroup",
            -- })
            --
            -- vim.cmd("TwilightEnable")
        end,
    },
}
