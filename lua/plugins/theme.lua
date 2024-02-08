return {
	{
		"AstroNvim/astrotheme",
		priority = 1000,
		config = function()
			require("astrotheme").setup({
				palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
				background = { -- :h background, palettes to use when using the core vim background colors
					light = "astrolight",
					dark = "astrodark",
				},

				style = {
					transparent = false, -- Bool value, toggles transparency.
					inactive = true, -- Bool value, toggles inactive window color.
					float = true, -- Bool value, toggles floating windows background colors.
					neotree = true, -- Bool value, toggles neo-trees background color.
					border = true, -- Bool value, toggles borders.
					title_invert = true, -- Bool value, swaps text and background colors.
					italic_comments = true, -- Bool value, toggles italic comments.
					simple_syntax_colors = false, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
				},

				termguicolors = true, -- Bool value, toggles if termguicolors are set by AstroTheme.

				terminal_color = true, -- Bool value, toggles if terminal_colors are set by AstroTheme.

				plugin_default = "auto", -- Sets how all plugins will be loaded
				-- "auto": Uses lazy / packer enabled plugins to load highlights.
				-- true: Enables all plugins highlights.
				-- false: Disables all plugins.
			})
			vim.cmd("colorscheme astrodark")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			-- require("transparent").setup({
			-- 	extra_groups = {
			-- 		"Normal",
			-- 		-- "NormalFloat",
			-- 		"NeoTreeNormal",
			-- 		"NeoTreeNormalNC",
			-- 		"NeoTreeEndOfBuffer",
			-- 	},
			-- })
		end,
	},
	{
		"zefei/vim-colortuner",
		priority = 10,
	},
}
