local function setup_colors(theme)
	vim.cmd.colorscheme(theme)

	local utils = require("he.utils")

	local toclear = {
		"Normal",
		"NormalFloat",
		"DiagnosticVirtualTextHint",
		"DiagnosticVirtualTextOk",
		"DiagnosticVirtualTextInfo",
		"DiagnosticVirtualTextWarn",
		"DiagnosticVirtualTextError",
	}

	utils:clear_group(toclear)
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		lazy = false,
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})
			setup_colors("rose-pine")
		end,
	},
}
