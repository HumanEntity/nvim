return {
	{
		"sainnhe/sonokai",
		dependencies = {
			"xiyaowong/transparent.nvim",
		},
		config = function()
			vim.cmd([[
			colorscheme sonokai
			TransparentEnable]])
		end,
		priority = 1000,
		cond = false,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"Normal",
					"NormalFloat",
					"NeoTreeNormal",
					"NeoTreeNormalNC",
					"NeoTreeEndOfBuffer",
				},
			})
		end,
	},
}
