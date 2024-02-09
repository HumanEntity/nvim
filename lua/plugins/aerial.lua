return {
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "treesitter", "lsp" },
			layout = { min_width = 28 },
			show_guides = true,
			filter_kind = false,
			guides = {
				mid_item = "├ ",
				last_item = "└ ",
				nested_top = "│ ",
				whitespace = "  ",
			},
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<leader>ls",
				function()
					require("aerial").toggle()
				end,
				{ desc = "Symbols Outline" },
			},
		},
	},
}
