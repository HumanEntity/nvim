return {
    {
        "tjdevries/ocaml.nvim",
        enabled = true,
        build = "make",
        config = function()
            -- require("ocaml").setup()
        end,
        lazy = false,
    },
}
