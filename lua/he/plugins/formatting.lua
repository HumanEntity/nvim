return {
    {
        "stevearc/conform.nvim",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                zig = { "zigfmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                arduino = { "clang-format" },
                -- markdown = { "markdownfmt" },
                markdown = { "mdformat" },
                ocaml = { "ocamlformat" },
                haskell = { "ormolu" },
                html = { "superhtml" },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "-style=file" },
                },
            },
            lsp_format = "never",
        },
        config = function(_, opts)
            require("conform").setup(opts)
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    require("conform").format({ bufnr = args.buf })
                end,
            })
        end,
    },
}
