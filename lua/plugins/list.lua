return {
	{
		"lervag/vimtex",
		lazy = false,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
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
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("plugins.config.harpoon")
		end,
		lazy = false,
	},
	{
		"nvim-orgmode/orgmode",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter", lazy = true },
		},
		event = "VeryLazy",
		config = function()
			-- Load treesitter grammar for org
			require("orgmode").setup_ts_grammar()

			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
			})
		end,
	},
	{ "ron-rs/ron.vim", lazy = false },
	{ "DingDean/wgsl.vim", lazy = false },
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		fn = "markdown",
	},
	{
		"preservim/vim-markdown",
		requires = {
			"godlygeek/tabular",
			"iamcco/markdown-preview.nvim",
		},
		ft = "markdown",
	},
	{
		"dhruvasagar/vim-table-mode",
		ft = "markdown",
	},
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
		"rust-lang/rust.vim",
		ft = "rust",
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
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "go", "rust", "lua" },
		config = function()
			require("plugins.config.null-ls")
		end,
	},
	-- LSP Support
}
