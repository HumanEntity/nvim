return {
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
	{ "ron-rs/ron.vim", lazy = false },
	{ "DingDean/wgsl.vim", lazy = false },
	-- Markdown
	{
		"preservim/vim-markdown",
		requires = {
			"godlygeek/tabular",
			"iamcco/markdown-preview.nvim",
		},
		ft = "markdown",
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},
}
