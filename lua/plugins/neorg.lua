return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/dev/notes",
								journal = "~/dev/journal",
							},
						},
					},
					["core.completion"] = { config = { engine = "nvim-cmp" } },
					["core.tangle"] = {},
					["core.integrations.treesitter"] = {},
					["core.ui"] = {},
					["core.ui.calendar"] = {},
					["core.journal"] = { config = { strategy = "flat", workspace = "journal" } },
					["core.qol.todo_items"] = {},
					["core.export"] = {},
					["core.export.markdown"] = {},
				},
			})
		end,
	},
}
