return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			"gcc",
			"gbc",
			{ "gc", mode = "v" },
			{ "gb", mode = "v" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
