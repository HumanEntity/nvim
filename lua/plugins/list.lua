return {
	{
		"lervag/vimtex",
		lazy = false,
	},
	-- {
	-- 	"tpope/vim-dadbod",
	-- 	dependencies = {
	-- 		"kristijanhusak/vim-dadbod-ui",
	-- 		"kristijanhusak/vim-dadbod-completion",
	-- 	},
	-- 	lazy = false,
	-- },
	-- {
	-- 	"ahmedkhalf/project.nvim",
	-- 	config = function()
	-- 		require("project_nvim").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		})
	-- 	end,
	-- },
	{ "mbbill/undotree", lazy = false },
	{
		"preservim/tagbar",
		lazy = false,
	},
	-- {
	-- 	"jcdickinson/codeium.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("codeium").setup({})
	-- 	end,
	-- },
	-- Haskell
	{
		"mrcjkb/haskell-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		branch = "2.x.x", -- recommended
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},
	-- Rust
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		config = function()
			require("plugins.config.rust-tools")
		end,
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
	-- Go
	{
		"olexsmir/gopher.nvim",
		dependencies = { -- dependencies
			"mfussenegger/nvim-dap",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("gopher").setup({
				commands = {
					go = "go",
					gomodifytags = "gomodifytags",
					gotests = "gotests", -- also you can set custom command path
					impl = "impl",
					iferr = "iferr",
				},
			})
		end,
		ft = { "go" },
	},
	-- Debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("plugins.config.dap")
		end,
		ft = { "rust", "go" },
	},
	-- LSP Support
}
