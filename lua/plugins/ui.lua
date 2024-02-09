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
		enabled = false,
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
			local theme = require("alpha.themes.theta")
			theme.header.val = {
				"",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
				"⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
				"⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
				"⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
				"⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
				"⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
				"⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
				"⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
				"⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
				"⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
				"⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
				"⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
				"⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
				"⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
			}
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
	{
		"roxma/vim-window-resize-easy",
		event = "VeryLazy",
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"onsails/lspkind.nvim",
		lazy = true,
		opts = {
			mode = "symbol_text",
			symbol_map = {
				Array = "󰅪",
				Boolean = "⊨",
				Key = "󰌆",
				Namespace = "󰅪",
				Null = "NULL",
				Number = "#",
				Object = "󰀚",
				Package = "󰏗",
				Reference = "",
				String = "󰀬",
				TypeParameter = "󰊄",
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
			},
			menu = {},
		},
		config = function(_, opts)
			require("lspkind").init(opts)
		end,
	},
}
