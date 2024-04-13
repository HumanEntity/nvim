-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("all", {clear = true}),
-- 	pattern = "main.rs",
-- 	callback = function()
-- 		local buf= vim.api.nvim_create_buf(false, false)
-- 		vim.fn.jobstart({"cargo", "run"}, {
-- 			stdout_buffered= true,
-- 			stderr_buffered= true,
-- 			on_stdout= function(_, data)
-- if data then
-- 					vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
-- 				end
-- 			end,
--})
-- 		local win= vim.api.nvim_open_win(buf, 0, {relative = "win", row = 3, col = 3, width = 12, height = 3})
-- 	end,
--})
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.script", command = "set filetype=lua" })
local norg_group = vim.api.nvim_create_augroup("norg_group", {
	clear = true,
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.norg",
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
	group = norg_group,
})
vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*.norg",
	callback = function()
		vim.opt.number = true
		vim.opt.relativenumber = true
	end,
	group = norg_group,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.odin",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.rs",
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "netrw",
	callback = function()
		local keymap = vim.keymap.set
		keymap("n", ".", "gh", { buffer = true })

		keymap("n", "<TAB>", "mf", { buffer = true })
		keymap("n", "<S-TAB>", "mF", { buffer = true })
		-- keymap("n", ".", "gh", { buffer = true })
		keymap("n", "ff", "%:w<CR>:buffer #<CR>", { buffer = true })
		keymap("n", "fe", "R", { buffer = true })
		keymap("n", "fc", "mc", { buffer = true })
		keymap("n", "fC", "mtmc", { buffer = true })
		keymap("n", "fx", "mm", { buffer = true })
		keymap("n", "fX", "mtmm", { buffer = true })
		keymap("n", "f;", "mx", { buffer = true })
	end,
})
