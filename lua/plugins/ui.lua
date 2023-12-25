return {
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle", "CccPick", "CccConvert" },
		config = function()
			require("ccc").setup({})
		end,
	},
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")

			vim.notify = notify
			notify.setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = "nvim-treesitter",
		tag = "v3.4.2",
		main = "ibl",
		opts = {
			indent = { char = "▏" },
			whitespace = { remove_blankline_trail = true },
			exclude = {
				filetypes = {
					"help",
					"terminal",
					"packer",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"alpha",
				},
				buftypes = { "terminal", "oil" },
			},
			-- show_trailing_blankline_indent = false,
			-- show_first_indent_level = false,
			-- space_char_blankline = " ",
			-- use_treesitter = true,
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
		lazy = false,
		keys = {
			{ "<leader>hd", ":Alpha<CR>", desc = "Dashboard" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
		lazy = false,
	},
}
