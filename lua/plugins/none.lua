return {
	{
		"nvimtools/none-ls.nvim",
		ft = { "go", "rust", "lua" },
		config = function()
			require("plugins.config.none-ls")
		end,
	},
}
