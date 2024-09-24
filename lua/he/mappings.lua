local map = function(mode, lhs, rhs, opts)
  require("he.utils").map(mode, lhs, rhs, opts, { silent = true })
end

map("n", "<ESC>", function()
  vim.cmd("noh")
end)

local opts = { noremap = true, silent = true }

-- map("n", "<left>", ":bprevious", { desc = "Previous buffer" })
-- map("n", "<right>", ":bnext", { desc = "Next buffer" })

-- -- HJKL in Insert mode
--
-- map("i", "<C-h>", "<left>")
-- map("i", "<C-j>", "<down>")
-- map("i", "<C-k>", "<up>")
-- map("i", "<C-l>", "<right>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

map("n", "j", "gj")
map("n", "k", "gk")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set("n", "<C-f>", ":!tmux neww tmux-sessionizer.sh<CR>")

map("n", "<left>", "<Nop>")
map("n", "<down>", "<Nop>")
map("n", "<right>", "<Nop>")
map("n", "<up>", "<Nop>")

map("i", "<left>", "<Nop>")
map("i", "<down>", "<Nop>")
map("i", "<right>", "<Nop>")
map("i", "<up>", "<Nop>")

-- Quickfix
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")

-- Code Folding
map("n", "<TAB>", "za")

map("n", "te", "tabedit")
vim.keymap.set("n", "te", ":tabedit ")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

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

require("he.custom.discipline").cowboy()
