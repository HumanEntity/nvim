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
		branch = "v2.x",
		config = function()
			require("plugins.config.lsp")
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
