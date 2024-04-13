return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		local map = require("he.utils").map

		map("n", "<C-Q>", function()
			harpoon:list():append()
		end, { desc = "Add mark" })

		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show marks" })

		map("n", "<C-N>", function()
			harpoon:list():next()
		end, { desc = "Next mark" })

		map("n", "<C-P>", function()
			harpoon:list():prev()
		end, { desc = "Prev mark" })
	end,
	lazy = false,
}
