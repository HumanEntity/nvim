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

function M.get_hlgroup(name, fallback)
	if vim.fn.hlexists(name) == 1 then
		local hl
		if vim.api.nvim_get_hl then -- check for new neovim 0.9 API
			hl = vim.api.nvim_get_hl(0, { name = name, link = false })
			if not hl.fg then
				hl.fg = "NONE"
			end
			if not hl.bg then
				hl.bg = "NONE"
			end
		else
			hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
			if not hl.foreground then
				hl.foreground = "NONE"
			end
			if not hl.background then
				hl.background = "NONE"
			end
			hl.fg, hl.bg = hl.foreground, hl.background
			hl.ctermfg, hl.ctermbg = hl.fg, hl.bg
			hl.sp = hl.special
		end
		return hl
	end
	return fallback or {}
end

return M
