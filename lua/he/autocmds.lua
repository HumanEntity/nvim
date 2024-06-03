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

local autocmd = vim.api.nvim_create_autocmd
local HeGroup = vim.api.nvim_create_augroup("HeGroup", {})

autocmd("BufWritePre", {
	pattern = "*.odin",
	group = HeGroup,
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
autocmd("BufWritePre", {
	pattern = "*.rs",
	group = HeGroup,
	callback = function()
		vim.lsp.buf.format()
	end,
})

autocmd("TextYankPost", {
	group = HeGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd({ "BufWritePre" }, {
	group = HeGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "netrw",
	group = HeGroup,
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

autocmd({ "LspAttach" }, {
	group = HeGroup,
	callback = function()
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { desc = "Hover info" })
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature info" })
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "diagnostic" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, { desc = "Next diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, { desc = "Prev diagnostic" })
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code action" })
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, { desc = "References" })
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename" })
		vim.keymap.set("n", "<C-q>", function()
			vim.diagnostic.setqflist({ open = true })
		end)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, { desc = "Signature help" })
	end,
})

autocmd({ "BufEnter" }, {
	group = HeGroup,
	pattern = "*.h",
	callback = function()
		vim.bo.filetype = "c"
		print("change to c")
	end,
})
