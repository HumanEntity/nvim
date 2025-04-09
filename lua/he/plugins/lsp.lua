return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "L3MON4D3/LuaSnip",
      "j-hui/fidget.nvim",
      -- "hrsh7th/cmp-nvim-lsp",
      "windwp/nvim-autopairs",
    },
    config = function()
      -- local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities()
      -- cmp_lsp.default_capabilities()
      )
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      vim.lsp.handlers["textDocument/hover"] =
          vim.lsp.with(vim.lsp.handlers.hover, { border = border("FloatBorder") })

      local on_attach = function(client, bufnr) end

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "taplo",
          -- "zls",
          --"clangd",
          -- "harper_ls",
        },
        handlers = {
          function(server_name)           -- default handler (optional)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,
          -- ["zls"] = function()
          --   local lspconfig = require("lspconfig")
          -- end,
          ["rust_analyzer"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                ["rust-analyzer"] = {
                  checkOnSave = {
                    command = "clippy",
                  },
                },
              },
            })
          end,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  },
                  workspace = {
                    checkThirdParty = false,
                    telemetry = { enable = false },
                    library = {
                      "${3rd}/love2d/library",
                    },
                  },
                },
              },
            })
          end,
          ["arduino_language_server"] = function()
            local lspconfig = require("lspconfig")

            local mason_registry = require("mason-registry")

            local clangd = mason_registry.get_package("clangd")
            local clangd_exe = clangd:get_install_path() .. "/clangd_18.1.3/bin/clangd"

            lspconfig.arduino_language_server.setup({
              -- capabilities = capabilities,
              on_attach = on_attach,
              cmd = {
                "arduino-language-server",
                "-cli-config",
                "/Users/tomek/Library/Arduino15/arduino-cli.yaml",
                -- "-fqbn",
                -- "esp32:esp32:esp32s2",
                "-clangd",
                clangd_exe,
              },
            })
          end,
          ["clangd"] = function()
            local lspconfig = require("lspconfig")

            -- Setup commented out due to tests with ccls (Performed)

            lspconfig.clangd.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              cmd = {
                "clangd",
                "--header-insertion=never",
              },
            })
          end,
        },
      })
      require("lspconfig").ols.setup({
        cmd = { os.getenv("HOME") .. "/code/tools/ols/ols" },
      })
      require("lspconfig").ocamllsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      do
        local lspconfig = require("lspconfig")

        local mason_registry = require("mason-registry")

        local clangd = mason_registry.get_package("clangd")
        local clangd_exe = clangd:get_install_path() .. "/clangd_18.1.3/bin/clangd"

        lspconfig.arduino_language_server.setup({
          -- capabilities = capabilities,
          on_attach = on_attach,
          cmd = {
            "arduino-language-server",
            "-cli-config",
            "/Users/tomek/Library/Arduino15/arduino-cli.yaml",
            -- "-fqbn",
            -- "esp32:esp32:esp32s2",
            "-clangd",
            clangd_exe,
          },
        })
      end
      -- require("lspconfig").zls.setup({
      --   root_dir = require("lspconfig").util.root_pattern(".git", "build.zig", "zls.json"),
      --   settings = {
      --     zls = {
      --       enable_inlay_hints = true,
      --       enable_snippets = true,
      --       warn_style = true,
      --     },
      --   },
      -- })
      -- vim.g.zig_fmt_parse_errors = 0
      -- vim.g.zig_fmt_autosave = 1
      -- require("lspconfig").ccls.setup({
      --   init_options = {
      --     cache = {
      --       directory = ".ccls-cache",
      --     },
      --   },
      -- })

      require("nvim-autopairs").setup({})

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",     -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*",         -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      },
    },
    lazy = false,

    -- use a release tag to download pre-built binaries
    -- version = "v0.*",
    build = "rustup run nightly cargo build --release",
    opts = {
      keymap = {
        ["<S-Tab>"] = { "select_next" },
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<C-h>"] = { "show" },
        ["<C-n>"] = { "show", "select_next" },
        ["<C-p>"] = { "show", "select_prev" },

        ["<C-space>"] = { "show" },         -- "show_documentiation", "hide_documentation" },
      },

      appearance = {
        nerd_font_variant = "normal",
      },
      snippets = { preset = "luasnip" },
      -- snippets = {
      --   expand = function(snippet)
      --     require("luasnip").lsp_expand(snippet)
      --   end,
      --   active = function(filter)
      --     if filter and filter.direction then
      --       return require("luasnip").jumpable(filter.direction)
      --     end
      --     return require("luasnip").in_snippet()
      --   end,
      --   jump = function(direction)
      --     require("luasnip").jump(direction)
      --   end,
      -- },
      sources = {
        default = { "path", "snippets", "lsp", "buffer" },
        -- optionally disable cmdline completions
        cmdline = {},
        providers = {
          snippets = {
            name = "LuaSnip",
            score_offset = 3,
            module = "blink.cmp.sources.snippets",
          },
        },
      },

      -- experimental signature help support
      -- signature = { enabled = true },

      -- Custom nvim-cmp like look
      completion = {
        menu = {
          auto_show = true,
          winblend = vim.o.pumblend,
          draw = {
            -- Aligns the keyword you've typed to a component in the menu
            -- align_to_component = "label", -- or 'none' to disable
            -- Left and right padding, optionally { left, right } for different padding on each side
            padding = 1,
            gap = 1,
            treesitter = {},             -- "lsp" },

            -- Components to render, grouped by column
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind",  "kind_icon",         "source_name", gap = 1 },
            },
            components = {
              -- detail = {},
              source_name = {
                ellipsis = false,
                width = { fill = true },
                text = function(ctx)
                  return "[" .. ctx.source_name .. "]"
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = { winblend = vim.o.pumblend },
        },
        -- ghost_text = { enabled = true },
      },
    },
  },
}
