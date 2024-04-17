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
}
