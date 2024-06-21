return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            -- optionally, override the default options:
            config = function()
                require("tailwindcss-colorizer-cmp").setup({
                    color_square_width = 2,
                })
                require("cmp").config.formatting = {
                    format = require("tailwindcss-colorizer-cmp").formatter,
                }
            end,
        },
        "L3MON4D3/LuaSnip",
        "j-hui/fidget.nvim",
        "windwp/nvim-autopairs",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

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

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                -- require("nvim-navic").attach(client, bufnr)
            end
        end

        require("fidget").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
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
            },
        })

        require("nvim-autopairs").setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            formatting = {
                fields = {
                    cmp.ItemField.Abbr,
                    cmp.ItemField.Kind,
                    cmp.ItemField.Menu,
                },
                format = require("tailwindcss-colorizer-cmp").formatter,
            },
            mapping = {
                ["<S-Tab>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),

                ["<C-Space>"] = cmp.mapping.complete(),
            },
            sources = cmp.config.sources({
                { name = "path" },
                { name = "luasnip",  keyword_length = 1 },
                { name = "nvim_lsp", keyword_length = 2 },
                { name = "buffer",   keyword_length = 1 },
            }),
        })
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
}
