local M = {}

M.map = function(mode, lhs, rhs, opts, default_opts)
	local options = opts or {}
	if default_opts ~= nil then
		for opt, val in pairs(default_opts) do
			options[opt] = val
		end
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

M.scratch = function()
	local bufnr = vim.api.nvim_create_buf(true, true)
	local winnr = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(winnr, bufnr)
end

return M
