return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.1',
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
		})

		local map = require("he.utils").map
		local builtin = require("telescope.builtin")

		map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		map("n", "<leader>fg", builtin.grep_string, { desc = "Live grep" })
		-- Git
		map("n", "<leader>gcl", builtin.git_commits, { desc = "Git log" })
		map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
		map("n", "<C-p>", builtin.git_files, { desc = "Git files" })
	end,
	cmd = "Telescope",
	lazy = false,
}
