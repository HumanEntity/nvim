return {
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local opts = {
                sources = {
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                    null_ls.builtins.formatting.golines,

                    null_ls.builtins.formatting.stylua,
                    -- null_ls.builtins.formatting.rustfmt,

                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.formatting.black,
                    -- null_ls.builtins.formatting.prettier.with({
                    --     extra_filetypes = { "javascriptreact", "typescriptreact", "astro" },
                    -- }),
                    -- null_ls.builtins.formatting.latexindent,
                    -- null_ls.builtins.formatting.clang_format,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            }

            null_ls.setup(opts)
        end,
    },
}
