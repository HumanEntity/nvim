require("harpoon").setup({})

local map = function(mode, lhs, rhs, opts)
	require("utils").map.set(mode, lhs, rhs, opts, { silent = true })
end

map("n", "<leader>ma", function()
	require("harpoon.mark").add_file()
end, { desc = "Add mark" })

map("n", "<leader>mm", function()
	require("harpoon.ui").toggle_quickmenu()
end, { desc = "Show marks" })

map("n", "<leader>mn", function()
	require("harpoon.ui").nav_next()
end, { desc = "Next mark" })

map("n", "<leader>mp", function()
	require("harpoon.ui").nav_prev()
end, { desc = "Prev mark" })
