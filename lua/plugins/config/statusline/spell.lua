local Spell = {
	condition = function()
		return vim.wo.spell
	end,
	provider = "SPELL",
	hl = { bold = true, fg = "orange" },
}

return Spell
