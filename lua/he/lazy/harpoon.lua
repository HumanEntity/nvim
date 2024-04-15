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

		map("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add mark" })

		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show marks" })

		-- map("n", "<C-N>", function()
		-- 	harpoon:list():next()
		-- end, { desc = "Next mark" })
		--
		-- map("n", "<C-P>", function()
		-- 	harpoon:list():prev()
		-- end, { desc = "Prev mark" })
		map("n", "<C-y>", function()
			harpoon:list():select(1)
		end)
		map("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		map("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		map("n", "<C-s>", function()
			harpoon:list():select(4)
		end)
	end,
	lazy = false,
}
