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
			print(comp)
			comps[#comps + 1] = M.require_comp(comp)
		end
	end
	return comps
end

local utils = M.require_comp("utils")

local components = {
	{ "mode", surround = true },
	utils.Space,
	{ { "filename", utils.Space, "fileinfo", utils.Space, "git" }, surround = true },
	-- utils.Space,
	-- { "git", surround = true },
	utils.Align,
	{
		{ "searchcount", "lsp" },
		surround = true,
	},
	utils.Align,
	{
		"ruler",
		utils.Space,
		"filetype",
	},
}

return M.load_comps(components)

-- return {
-- 	require_comp("mode"),
-- 	require_comp("filename"),
-- 	require_comp("git"),
-- 	utils.Align,
-- 	require_comp("lsp"),
-- 	utils.Align,
-- }
