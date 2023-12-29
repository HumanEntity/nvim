local M = {}

function M.require_comp(str)
	return require("plugins.config.statusline." .. str)
end

function M.is_special(comp)
	if comp == "%=" or comp == " " then
		return true
	else
		return false
	end
end

function M.surround(comp)
	return require("heirline.utils").surround({ "", "" }, "bg", comp)
end

function M.load_comp(comp)
	if type(comp) == "table" then
		return M.load_comps(comp)
	elseif M.is_special(comp) then
		return { provider = comp }
	else
		return M.require_comp(comp)
	end
end

function M.load_comps(components)
	local comps = {}
	for _, comp in pairs(components) do
		if type(comp) == "table" then
			local subcomponents = M.load_comp(comp)
			if comp["surround"] then
				comps[#comps + 1] = M.surround(subcomponents)
			else
				comps[#comps + 1] = subcomponents
			end
		elseif M.is_special(comp) then
			comps[#comps + 1] = { provider = comp }
		elseif type(comp) == "string" then
			comps[#comps + 1] = M.require_comp(comp)
		end
	end
	return comps
end

local utils = M.require_comp("utils")

local default_components = {
	{
		{ "mode", "macrorec", "showcmd", "searchcount" },
		surround = true,
	},
	utils.Space,
	-- { "workdir", surround = true },
	-- utils.Space,
	{
		{
			"workdir",
			-- utils.Space,
			"filename",
			utils.Space,
			"fileinfo",
			utils.Space,
			"filelastmodified",
			utils.Space,
			"git",
		},
		surround = true,
	},
	utils.Space,
	-- { "git", surround = true },
	{
		{ "lsp", utils.Space, "navic", utils.Space, "dap" },
		surround = true,
	},
	utils.Align,
	{
		{ "spell", utils.Space, "ruler", utils.Space, "filetype", utils.Space },
		surround = true,
	},
}

local inactive_components = {
	{
		{
			"filename",
			utils.Space,
			"fileinfo",
			utils.Space,
			"filetype",
		},
		surround = true,
	},
}

local conditions = require("heirline.conditions")

local default = M.load_comps(default_components)

local inactive = M.load_comps(inactive_components)
inactive["condition"] = conditions.is_not_active

return {
	hl = function()
		if conditions.is_active() then
			return "StatusLine"
		else
			return "StatusLineNC"
		end
	end,

	-- the first statusline with no condition, or which condition returns true is used.
	-- think of it as a switch case with breaks to stop fallthrough.
	fallthrough = false,
	inactive,
	default,
}

-- return {
-- 	require_comp("mode"),
-- 	require_comp("filename"),
-- 	require_comp("git"),
-- 	utils.Align,
-- 	require_comp("lsp"),
-- 	utils.Align,
-- }
