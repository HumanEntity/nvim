return {
	{
		lazy = false,
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		opts = {
			sources = { "buffers", "filesystem", "document_symbols" },
			filesystem = {
				hijack_netrw_behavior = "open_current",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		cmd = "Neotree",
		keys = {
			{ "<C-n>", "<cmd>Neotree filesystem toggle left<CR>", desc = "Toggle neotree" },
		},
		-- config = function ()
		--
		-- end
	},
}
