local map = function(mode, lhs, rhs, opts)
	require("utils").map(mode, lhs, rhs, opts, { silent = true })
end

map("n", "<ESC>", function()
	vim.cmd("noh")
end)

-- map("n", "<left>", ":bprevious", { desc = "Previous buffer" })
-- map("n", "<right>", ":bnext", { desc = "Next buffer" })

-- -- HJKL in Insert mode
--
-- map("i", "<C-h>", "<left>")
-- map("i", "<C-j>", "<down>")
-- map("i", "<C-k>", "<up>")
-- map("i", "<C-l>", "<right>")

map("n", "j", "gj")
map("n", "k", "gk")

map("n", "<left>", "<Nop>")
map("n", "<down>", "<Nop>")
map("n", "<right>", "<Nop>")
map("n", "<up>", "<Nop>")

map("i", "<left>", "<Nop>")
map("i", "<down>", "<Nop>")
map("i", "<right>", "<Nop>")
map("i", "<up>", "<Nop>")

-- Hub
-- map("n", "<leader>hd", ":Alpha<CR>", { desc = "Dashboard" })
map("n", "<leader>hr", ":source $HOME/.config/nvim/init.lua<CR>", { desc = "Hot reload" })
map("n", "<leader>hnw", ":Neorg workspace ", { desc = "Neorg workspace", silent = false })
map("n", "<leader>hnj", ":Neorg journal ", { desc = "Neorg journal", silent = false })
map("n", "<leader>hnn", ":Neorg workspace notes<CR>", { desc = "Neorg notes workspace" })
map("n", "<leader>hs", require("utils").scratch, { desc = "Open scratch buffer" })

-- Splitting
map("n", "<leader>ss", ":vsplit<CR>")
map("n", "<leader>sd", ":split<CR>")

-- Code Folding
map("n", "<TAB>", "za")
map("n", "<leader>zf", "zf%")

vim.g.tagbar_focus_key = vim.api.nvim_replace_termcodes("<C-w>l", true, true, true)

-- Lazy

map("n", "<leader>ls", ":Lazy show<CR>", { desc = "Show" })
map("n", "<leader>lc", ":Lazy clean<CR>", { desc = "Clean" })

-- ---------------------------------
--           -- Notes --
-- ---------------------------------
-- map("n", "<leader>ns", ":e ~/dev/notes/index.md<CR>", { desc = "Switch to notes" })

-- ---------------------------------
--            -- Rust --
-- ---------------------------------

local rust_group = vim.api.nvim_create_augroup("rust", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.rs",
	group = rust_group,
	callback = function()
		map("n", "<leader>ab", function()
			vim.cmd("Cargo build")
		end, { desc = "Cargo build" })
		map("n", "<leader>ac", function()
			vim.cmd("Cargo check")
		end, { desc = "Cargo check" })
	end,
})

-- ---------------------------------
--        -- Markdown --
-- ---------------------------------

local md_group = vim.api.nvim_create_augroup("md", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md", "*.markdown" },
	group = md_group,
	callback = function()
		map("n", "<leader>ap", function()
			vim.cmd("MarkdownPreviewToggle")
		end, { desc = "Toggle Markdown Preview" })
		-- vim.cmd.TableModeEnable()
		-- vim.opt.number = false
		-- vim.opt.relativenumber = false
	end,
})
-- vim.api.nvim_create_autocmd("BufLeave", {
-- 	pattern = { "*.md", "*.markdown" },
-- 	group = md_group,
-- 	callback = function()
-- 		map("n", "<leader>ap", function() end, { desc = "Unbound" })
-- 		vim.opt.number = true
-- 		vim.opt.relativenumber = true
-- 		vim.cmd.TableModeDisable()
-- 	end,
-- })
