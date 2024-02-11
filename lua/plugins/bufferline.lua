return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "UiEnter",
		config = function()
			require("bufferline").setup({
				options = {
					separator_style = "slope",
					color_icons = true,
					indicator = "underline",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, _diagnostics_dict, _context)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					groups = {
						options = {
							toggle_hidden_on_enter = true,
						},
						items = {
							{
								name = "Tests", -- Mandatory
								highlight = { underline = true, sp = "blue" }, -- Optional
								priority = 2, -- determines where it will appear relative to other groups (Optional)
								icon = "", -- Optional
								matcher = function(buf) -- Mandatory
									return buf.name:match("%_test") or buf.name:match("%_spec")
								end,
							},
							{
								name = "Docs",
								highlight = { undercurl = true, sp = "green" },
								auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
								matcher = function(buf)
									return buf.name:match("%.md") or buf.name:match("%.txt")
								end,
								separator = { -- Optional
									style = require("bufferline.groups").separator.tab,
								},
							},
						},
					},
				},
			})
		end,
	},
}
