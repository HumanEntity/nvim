return {
	-- "rebelot/heirline.nvim",
	-- -- You can optionally lazy-load heirline on UiEnter
	-- -- to make sure all required plugins and colorschemes are loaded before setup
	-- event = "UiEnter",
	-- config = function()
	-- 	local utils = require("heirline.utils")
	-- 	local p = require("rose-pine.palette")
	--
	-- 	local colors = {
	-- 		-- bright_bg = utils.get_highlight("Folded").bg,
	-- 		-- bright_fg = utils.get_highlight("Folded").fg,
	-- 		-- red = utils.get_highlight("DiagnosticError").fg,
	-- 		-- dark_red = utils.get_highlight("DiffDelete").bg,
	-- 		-- green = utils.get_highlight("String").fg,
	-- 		-- blue = utils.get_highlight("Function").fg,
	-- 		-- gray = utils.get_highlight("NonText").fg,
	-- 		-- orange = utils.get_highlight("Constant").fg,
	-- 		-- purple = utils.get_highlight("Statement").fg,
	-- 		-- cyan = utils.get_highlight("Special").fg,
	-- 		bg = p.surface,
	-- 		fg = p.text,
	-- 		fg_alt = p.subtle,
	-- 		yellow = p.gold,
	-- 		cyan = p.foam,
	-- 		green = p.pine,
	-- 		orange = p.rose,
	-- 		magenta = p.iris,
	-- 		blue = p.foam,
	-- 		red = p.love,
	-- 		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
	-- 		diag_error = utils.get_highlight("DiagnosticError").fg,
	-- 		diag_hint = utils.get_highlight("DiagnosticHint").fg,
	-- 		diag_info = utils.get_highlight("DiagnosticInfo").fg,
	-- 		git_del = p.love,
	-- 		git_add = p.foam,
	-- 		git_change = p.rose,
	-- 	}
	--
	-- 	require("heirline").setup({
	-- 		opts = {
	-- 			colors = colors,
	-- 		},
	-- 		statusline = require("plugins.config.statusline"),
	-- 	})
	-- end,
	{
		"nvim-lualine/lualine.nvim",
		event = "UiEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
					theme = "auto",
					component_separators = { left = "", right = "" },
					-- component_separators = { left = "\\", right = "/" },
					-- component_separators = "|",
					-- section_separators = { left = separators.round.right, right = separators.round.left },
					globalstatus = true,
				},
				sections = {
					lualine_a = {
						{ "mode", right_padding = 2 },
					},
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
					},
					lualine_c = {
						"filename",
						function()
							return vim.fn["nvim_treesitter#statusline"](180)
						end,
					},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = {
						{
							"location",
							-- left_padding = 2,
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
				extensions = {
					"quickfix",
					"fugitive",
					"mason",
					"trouble",
				},
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
	},
}
