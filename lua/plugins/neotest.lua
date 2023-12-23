return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"rouge8/neotest-rust",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest-rust")
		end,
	},
}
