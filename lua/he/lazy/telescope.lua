return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.1',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["%"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
						},
					},
				},
			},
		})
		require("telescope").load_extension("zf-native")
		require("telescope").load_extension("file_browser")

		local map = require("he.utils").map
		local builtin = require("telescope.builtin")

		map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		map("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
		map("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		-- Git
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		map("n", "<C-p>", builtin.git_files, { desc = "Git files" })
	end,
	cmd = "Telescope",
	lazy = false,
}
