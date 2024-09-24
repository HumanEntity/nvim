return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "L3MON4D3/LuaSnip",
            "j-hui/fidget.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "windwp/nvim-autopairs",
        },
        config = function()
            local cmp_lsp = require("cmp_nvim_lsp")
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

            local on_attach = function(client, bufnr) end

            require("fidget").setup()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "taplo",
                    "zls",
                    "clangd",
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
                },
            })
            require("lspconfig").ols.setup({})

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
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            local auto_select = true
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
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
                    format = function(entry, item)
                        -- item.kind = string.sub(item.kind, 1, 1)

                        local symbol_map = {
                            Text = "󰦨",
                            Method = "󰆧",
                            Function = "󰊕",
                            Constructor = "",
                            Field = "",
                            Variable = "󰫧",
                            Class = "",
                            Interface = "󱘎",
                            Module = "󰆧",
                            Property = "",
                            Unit = "",
                            Value = "󰀬",
                            Enum = "",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "󰏿",
                            Struct = "",
                            Event = "",
                            Operator = "",
                            TypeParameter = "",
                            Empty = "",
                        }

                        item.kind = symbol_map[item.kind or "Empty"] .. " " .. item.kind

                        item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]",
                        })[entry.source.name]

                        local widths = {
                            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                            end
                        end

                        return item
                    end,
                },
                mapping = {
                    ["<S-Tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                    ["<C-h>"] = function()
                        vim.lsp.buf.signature_help()
                    end,

                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "luasnip", keyword_length = 1 },
                    { name = "nvim_lsp", keyword_length = 2 },
                    { name = "buffer", keyword_length = 1 },
                }),
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = {
                        hl_group = "CmpGhostText",
                    },
                },
            }
        end,
    },
}
