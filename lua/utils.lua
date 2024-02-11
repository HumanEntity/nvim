local M = {}

M.map = function(mode, lhs, rhs, opts, default_opts)
	local options = opts or {}
	if rhs == nil then
		require("which-key").register({
			[lhs] = {
				name = " " .. opts.desc,
			},
		})
		return
	end
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

M.plugin_opts = function(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	local lazy_plugin_avail, lazy_plugin = pcall(require, "lazy.core.plugin")
	local opts = {}
	if lazy_config_avail and lazy_plugin_avail then
		local spec = lazy_config.spec.plugins[plugin]
		if spec then
			opts = lazy_plugin.values(spec, "opts")
		end
	end
	return opts
end

return M
