return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                              , branch = '0.1.1',
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"luc-tielen/telescope_hoogle",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("telescope").setup({

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

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
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
	},
}
