return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter_opts = {
					relative_time = false,
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

			local HeFugitive = vim.api.nvim_create_augroup("HeFugitive", {})

			local autocmd = vim.api.nvim_create_autocmd
			autocmd("BufWinEnter", {
				group = HeFugitive,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end

					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }
					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git("push")
					end, opts)
					vim.keymap.set("n", "<leader>P", function()
						vim.cmd.Git({ "pull", "--rebase" })
					end, opts)
				end,
			})
		end,
	},
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("git-worktree").setup({})
			require("telescope").load_extension("git_worktree")
		end,
		keys = {
			{
				"<leader>gwc",
				function()
					require("telescope").extensions.git_worktree.create_git_worktree()
				end,
			},
			{
				"<leader>gws",
				function()
					require("telescope").extensions.git_worktree.git_worktrees()
				end,
			},
		},
	},
}
