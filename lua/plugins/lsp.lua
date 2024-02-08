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
				dependencies = {
					{ "hrsh7th/cmp-nvim-lsp" }, -- Required
					{ "hrsh7th/cmp-buffer" },
					{ "hrsh7th/cmp-path" },
					{ "saadparwaiz1/cmp_luasnip" },
				},
			}, -- Required
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			}, -- Required
			{ "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach" },
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
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		event = "LspAttach",
		config = function()
			require("nvim-navic").setup({})
		end,
	},
}
