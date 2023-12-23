return {
	{
		"sidebar-nvim/sidebar.nvim",
		config = function()
			local sidebar = require("sidebar-nvim")
			sidebar.setup({
				sections = { "symbols" },
				side = "right",
			})
		end,
	},
}
