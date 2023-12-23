return {
	{
		"mrcjkb/haskell-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		branch = "2.x.x", -- recommended
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},
}
