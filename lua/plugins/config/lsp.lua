local lsp = require("lsp-zero").preset({})

local servers = {
	"rust_analyzer",
	-- "gopls",
	"clangd",
	"lua_ls",
	"marksman",
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").clangd.setup({})
require("lspconfig").zls.setup({})
require("lspconfig").gdscript.setup({
	on_attach = function(client)
		local _notify = client.notify
		client.notify = function(method, params)
			if method == "textDocument/didClose" then
				-- Godot doesn't implement didClose yet
				return
			end
			_notify(method, params)
		end
	end,
})
require("lspconfig").rust_analyzer.setup({
	-- cmd = { "ra-multiplex" },
})

-- Make sure you setup `cmp` after lsp-zero

-- lsp.set_sign_icons({
-- 	error = " ",
-- 	warn = " ",
-- 	info = " ",
-- 	hint = " ",
-- })

lsp.on_attach(function(client, bufnr)
	require("fidget").setup({})
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
	-- local opts = { buffer = bufnr, remap = false }

	-- local map = function(mode, lhs, rhs, opts)
	-- 	local options = opts or {}
	-- 	options.buffer = bufnr
	-- 	options.remap = false
	-- 	vim.keymap.set(mode, lhs, rhs, opts)
	-- end

	local utils = require("utils")
	local map = function(mode, lhs, rhs, opts)
		local desc = "LSP: " .. opts.desc
		utils.map(mode, lhs, rhs, opts, { buffer = bufnr, remap = false, desc = desc })
	end

	map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
	map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
	map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
	map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
	map("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
	map("n", "K", function()
		-- local winid = require("ufo").peekFoldedLinesUnderCursor()
		-- if not winid then
		vim.lsp.buf.hover()
		-- end
	end, { desc = "Hover info" })
	map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature info" })
	map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
	map("n", "<leader>vd", vim.diagnostic.open_float, { desc = "diagnostic" })
	map("n", "[d", function()
		vim.diagnostic.goto_next()
	end, { desc = "Next diagnostic" })
	map("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, { desc = "Prev diagnostic" })
	map("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, { desc = "Code action" })
	map("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, { desc = "References" })
	map("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, { desc = "Rename" })
	map("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { desc = "Signature help" })
	map("n", "<leader>af", ":LspZeroFormat<CR>", { desc = "Format" })
end)

lsp.setup()

require("plugins.cmp")
