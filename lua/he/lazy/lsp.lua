return {
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
		ft = "lua",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		config = function()
			local lsp = require("lsp-zero").preset("recommended")

			local servers = {
				"rust_analyzer",
				-- "gopls",
				"clangd",
				"lua_ls",
				"marksman",
				"ols",
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			-- (Optional) Configure lua language server for neovim
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			require("lspconfig").clangd.setup({})
			require("lspconfig").zls.setup({})
			require("lspconfig").rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
			require("lspconfig").marksman.setup({})
			require("lspconfig").pylsp.setup({})
			require("lspconfig").ols.setup({
				-- capabilites = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
			})

			-- Make sure you setup `cmp` after lsp-zero

			lsp.set_sign_icons({
				error = " ",
				warn = " ",
				info = " ",
				hint = " ",
			})

			local on_attach = function(client, bufnr)
				local utils = require("he.utils")
				local map = function(mode, lhs, rhs, opts)
					local desc = "LSP: " .. opts.desc
					utils.map(mode, lhs, rhs, opts, { buffer = bufnr, remap = false, desc = desc })
				end
				require("luasnip").setup()

				map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
				map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
				map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
				map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
				map("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
				map("n", "K", function()
					vim.lsp.buf.hover()
				end, { desc = "Hover info" })
				-- map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature info" })
				map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
				map("n", "<leader>vd", vim.diagnostic.open_float, { desc = "diagnostic" })
				map("n", "[d", function()
					vim.diagnostic.goto_next()
				end, { desc = "Next diagnostic" })
				map("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, { desc = "Prev diagnostic" })
				map("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, { desc = "Code action" })
				map("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, { desc = "References" })
				map("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, { desc = "Rename" })
				map("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, { desc = "Signature help" })
			end

			lsp.on_attach(on_attach)
			lsp.setup()
		end,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				-- build = ":MasonUpdate",
				dependencies = { { "williamboman/mason-lspconfig.nvim" } },
			},

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
			}, -- Required
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			}, -- Required
			{
				"ray-x/lsp_signature.nvim",
				event = "VeryLazy",
				opts = {},
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},
		},
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				position = "right",
			})
			vim.keymap.set("n", "<leader>ht", ":TroubleToggle<CR>")
		end,
		cmd = "TroubleToggle",
		-- lazy = false,
	},
}
