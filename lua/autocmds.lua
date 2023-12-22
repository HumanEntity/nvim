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
