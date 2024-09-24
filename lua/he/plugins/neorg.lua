return {
    "nvim-neorg/neorg",
    -- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    event = "VeryLazy",
    cmd = "Neorg",
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        notes = "~/Documents/notes/",
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require("neorg").setup(opts)
    end,
}
