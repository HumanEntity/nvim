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
        markdown = { "markdownfmt" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "-style=file" },
        },
      },
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
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  --   config = function()
  --     local null_ls = require("null-ls")
  --     local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})
  --
  --     local opts = {
  --       debug = true,
  --       sources = {
  --         -- null_ls.builtins.formatting.gofumpt,
  --         -- null_ls.builtins.formatting.goimports_reviser,
  --         -- null_ls.builtins.formatting.golines,
  --         -- null_ls.builtins.formatting.prettier,
  --
  --         null_ls.builtins.formatting.stylua,
  --         -- null_ls.builtins.formatting.rustfmt,
  --
  --         null_ls.builtins.code_actions.gitsigns,
  --         -- null_ls.builtins.diagnostics.mypy,
  --         -- null_ls.builtins.formatting.black,
  --         -- null_ls.builtins.formatting.prettier.with({
  --         --     extra_filetypes = { "javascriptreact", "typescriptreact", "astro" },
  --         -- }),
  --         -- null_ls.builtins.formatting.latexindent,
  --
  --         null_ls.builtins.formatting.clang_format,
  --         -- null_ls.builtins.formatting.ocamlformat,
  --       },
  --       on_attach = function(client, bufnr)
  --         local ret = require("null-ls.sources").get_available(vim.bo[bufnr].filetype, "NULL_LS_FORMATTING") or {}
  --         vim.print(ret)
  --
  --         print(string.format("NoneLs formatting support: %s",
  --           tostring(client.supports_method("textDocument/formatting"))))
  --
  --         -- print("NoneLs Attaching")
  --         if client.supports_method("textDocument/formatting", bufnr) then
  --           print("None formats")
  --           vim.api.nvim_clear_autocmds({
  --             group = augroup,
  --             buffer = bufnr,
  --           })
  --           vim.api.nvim_create_autocmd("BufWritePre", {
  --             group = augroup,
  --             buffer = bufnr,
  --             callback = function()
  --               print("HEllo")
  --               print("HEllo")
  --               print("HEllo")
  --               vim.lsp.buf.format({
  --                 filter = function(c)
  --                   return c.name == "null-ls"
  --                 end,
  --                 bufnr = bufnr,
  --                 -- id = client.id
  --               })
  --             end,
  --           })
  --         end
  --       end,
  --     }
  --
  --     null_ls.setup(opts)
  --     -- vim.print(null_ls.get_sources())
  --   end,
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   lazy = false,
  --   config = function()
  --     -- IMPORTANT!
  --     local augroup = vim.api.nvim_create_augroup("NoneLsFormatting", {})
  --
  --     local on_attach = function(client, bufnr)
  --       if client.supports_method("textDocument/formatting") then
  --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --         vim.api.nvim_create_autocmd("BufWritePre", {
  --           group = augroup,
  --           buffer = bufnr,
  --           callback = function()
  --             vim.lsp.buf.format({ bufnr = bufnr })
  --           end,
  --         })
  --       end
  --     end
  --
  --     local null_ls = require("null-ls")
  --     null_ls.setup({
  --       sources = {
  --         -- lua
  --         null_ls.builtins.formatting.stylua,
  --       },
  --       on_attach = on_attach,
  --     })
  --   end,
  -- }
}
