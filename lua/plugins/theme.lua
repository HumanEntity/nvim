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
