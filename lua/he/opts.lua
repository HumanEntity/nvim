vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.tagbar_autofocus = 1
-- vim.g.vim_markdown_conceal = 2
vim.g.tagbar_position = "right"
vim.cmd([[
set spell spelllang=en_us
]])
vim.g.git_messenger_no_default_mappings = true

vim.wo.foldlevel = 20
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false
-- vim.opt.textwidth = 0
-- vim.opt.wrapmargin = 0

vim.opt.swapfile = true
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.cmdheight = 0

vim.opt.background = "dark"

-- VimTex
vim.g.vimtex_view_method = "zathura"

-- Netrw

vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_banner = 0

vim.g.netrw_list_hide = "(^|ss)\zs.S+"
vim.g.netrw_liststyle = 0

vim.g.netrw_localcopydircmd = "cp -r"

vim.cmd("hi! link netrwMarkFile Search")

vim.opt.mouse = ""

vim.opt.path:append({ "**" })
vim.opt.formatoptions:append({ "r" })

vim.opt.laststatus = 2

vim.opt.colorcolumn = "80"

vim.opt.pumblend = 15

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.cursorline = true
