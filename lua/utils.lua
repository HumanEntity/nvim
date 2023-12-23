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

return M
