return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"rouge8/neotest-rust",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest-rust")
		end,
		cond = false,
	},
	-- {
	-- 	"vim-test/vim-test",
	-- 	dependencies = {
	-- 		"preservim/vimux",
	-- 	},
	-- 	config = function()
	-- 		vim.g.strategy = "vimux"
	-- 		vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", { desc = "Test nearest", silent = true })
	-- 		vim.keymap.set("n", "<leader>tT", ":TestFile<CR>", { desc = "Test file", silent = true })
	-- 		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test suite", silent = true })
	-- 	end,
	-- },
}
