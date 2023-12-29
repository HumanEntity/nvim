return {
	-- {
	-- 	"rust-lang/rust.vim",
	-- 	ft = "rust",
	-- },
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		-- config = function()
		-- 	require("plugins.config.rust-tools")
		-- end,
	},
	{
		"saecki/crates.nvim",
		ft = { "rust", "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			crates.show()
		end,
	},
}
