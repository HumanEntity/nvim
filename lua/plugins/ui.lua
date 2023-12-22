return {
	"folke/zen-mode.nvim",
	"folke/twilight.nvim",
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({})
		end,
		lazy = true,
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
		tag = "v2.20.8",
		config = function()
			local indent_blankline = require("indent_blankline")

			-- vim.opt.list = false
			-- vim.opt.listchars:append("space:⋅")
			-- vim.opt.listchars:append("eol:↴")
			-- vim.opt.listchars:append("tabulator:↴")

			vim.cmd([[highlight IndentBlanklineChar guifg=#353535 gui=nocombine]])

			indent_blankline.setup({
				char = "▏",
				filetype_exclude = {
					"help",
					"terminal",
					"packer",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"alpha",
				},
				buftype_exclude = { "terminal", "oil" },
				show_trailing_blankline_indent = false,
				show_first_indent_level = false,
				space_char_blankline = " ",
				use_treesitter = true,
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
		lazy = false,
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
