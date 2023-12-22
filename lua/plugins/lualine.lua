return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local default_sep_icons = {
				default = { left = "", right = " " },
				round = { left = "", right = "" },
				block = { left = "█", right = "█" },
				arrow = { left = "", right = "" },
			}

			local separators = default_sep_icons

			require("lualine").setup({
				options = {
					-- component_separators = { left = "", right = "" },
					-- component_separators = { left = "\\", right = "/" },
					component_separators = "|",
					section_separators = { left = separators.round.right, right = separators.round.left },
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = separators.round.left }, right_padding = 2 },
					},
					lualine_b = {
						{ "filename", separator = "\\" },
						"filetype",
						"branch",
					},
					lualine_c = { "searchcount", "diff", "diagnostics" },
					lualine_x = {},
					lualine_y = { "progress" },
					lualine_z = {
						{
							"location",
							separator = { right = separators.round.right },
							left_padding = 2,
						},
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {
					lualine_a = {
						"buffers",
					},
				},
				extensions = { "quickfix" },
			})

			-- left = '',
			-- right = '',
			-- block = '█',
			-- left_filled = '',
			-- right_filled = '',
			-- slant_left = '',
			-- slant_left_thin = '',
			-- slant_right = '',
			-- slant_right_thin = '',
			-- slant_left_2 = '',
			-- slant_left_2_thin = '',
			-- slant_right_2 = '',
			-- slant_right_2_thin = '',
			-- left_rounded = '',
			-- left_rounded_thin = '',
			-- right_rounded = '',
			-- right_rounded_thin = '',
			-- circle = '●',
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
