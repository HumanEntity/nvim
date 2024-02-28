local opt = vim.opt

-- Options

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

-- Netrw

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0

vim.g.netrw_list_hide = "(^|ss)\zs.S+"

vim.g.netrw_localcopydircmd = "cp -r"

vim.cmd("hi! link netrwMarkFile Search")

local map = vim.keymap.set

-- Plugins

local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require("pckr.loader.cmd")
local keys = require("pckr.loader.keys")

require("pckr").add({
	-- My plugins here
	-- 'foo1/bar1.nvim';
	-- 'foo2/bar2.nvim';
	{
		"akinsho/horizon.nvim",
		config = function()
			vim.cmd("colorscheme horizon")
		end,
	},
	{
		"tpope/vim-dispatch",
		cond = {
			cmd("Dispatch"),
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			map("n", "<leader>ff", require("telescope.builtin").find_files)

			map("n", "<leader>fg", require("telescope.builtin").grep_string)
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		lazy = false,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
		lazy = false,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
})
