return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.1',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"luc-tielen/telescope_hoogle",
			"nvim-telescope/telescope-ui-select.nvim",
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
				extensions = {
					-- file_browser = {
					-- 	-- theme = "ivy",
					-- 	-- disables netrw and use telescope-file-browser in its place
					-- 	hijack_netrw = true,
					-- 	mappings = {
					-- 		["i"] = {
					-- 			-- your custom insert mode mappings
					-- 		},
					-- 		["n"] = {
					-- 			-- your custom normal mode mappings
					-- 		},
					-- 	},
					-- },
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
			-- require("telescope").load_extension("hoogle")
			-- require("telescope").load_extension("projects")
		end,
		cmd = "Telescope",
		keys = {
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "Live grep",
			},
			-- Git
			{
				"<leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "Git status",
			},
			{
				"<leader>gcl",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Git log",
			},
			{
				"<leader>gb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Git branches",
			},
			{
				"<leader>gf",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Git files",
			},
		},
	},
}
