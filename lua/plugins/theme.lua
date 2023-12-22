return {
	{
		"sainnhe/sonokai",
		dependencies = {
			"xiyaowong/transparent.nvim",
		},
		config = function()
			vim.cmd("colorscheme sonokai")
		end,
		priority = 1000,
	},
}
