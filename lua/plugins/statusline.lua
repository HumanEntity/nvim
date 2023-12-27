return {
	"rebelot/heirline.nvim",
	-- You can optionally lazy-load heirline on UiEnter
	-- to make sure all required plugins and colorschemes are loaded before setup
	event = "UiEnter",
	config = function()
		local utils = require("heirline.utils")
		local p = require("rose-pine.palette")

		local colors = {
			-- bright_bg = utils.get_highlight("Folded").bg,
			-- bright_fg = utils.get_highlight("Folded").fg,
			-- red = utils.get_highlight("DiagnosticError").fg,
			-- dark_red = utils.get_highlight("DiffDelete").bg,
			-- green = utils.get_highlight("String").fg,
			-- blue = utils.get_highlight("Function").fg,
			-- gray = utils.get_highlight("NonText").fg,
			-- orange = utils.get_highlight("Constant").fg,
			-- purple = utils.get_highlight("Statement").fg,
			-- cyan = utils.get_highlight("Special").fg,
			bg = p.surface,
			fg = p.text,
			fg_alt = p.subtle,
			yellow = p.gold,
			cyan = p.rose,
			green = p.pine,
			orange = p.muted,
			magenta = p.iris,
			blue = p.foam,
			red = p.love,
			diag_warn = utils.get_highlight("DiagnosticWarn").fg,
			diag_error = utils.get_highlight("DiagnosticError").fg,
			diag_hint = utils.get_highlight("DiagnosticHint").fg,
			diag_info = utils.get_highlight("DiagnosticInfo").fg,
			git_del = utils.get_highlight("DiffDelete").bg,
			git_add = utils.get_highlight("DiffAdd").bg,
			git_change = utils.get_highlight("DiffChange").bg,
		}

		require("heirline").setup({
			opts = {
				colors = colors,
			},
			statusline = require("plugins.config.statusline"),
		})
	end,
}
