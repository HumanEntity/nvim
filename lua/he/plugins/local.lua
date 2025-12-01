return {
    -- {
    --     "denote",
    --     dir = "~/code/nvim/denote.nvim",
    --     config = function()
    --         require("denote"):setup({
    --             note_dir = "~/.denote/",
    --         })
    --     end,
    -- },
    {
        "compile",
        dir = "~/personal/plugins/compile-mode/",
        config = function()
            require("compile").setup()
        end,
        lazy = false,
    },
    {
        "norg",
        dir = "~/personal/plugins/norg/",
        config = function()
            require("norg").setup()
        end,
        lazy = false,
    },
}
