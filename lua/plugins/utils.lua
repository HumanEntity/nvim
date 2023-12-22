return {
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()

			vim.keymap.set("n", "<leader>fbe", "<CMD>Oil<CR>", { desc = "Edit file structure", silent = true })
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		lazy = false,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
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
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		lazy = false,
	},
}