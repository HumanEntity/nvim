return {
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("smart-splits").setup()
			local maps = {
				["<A-h>"] = require("smart-splits").resize_left,
				["<A-j>"] = require("smart-splits").resize_down,
				["<A-k>"] = require("smart-splits").resize_up,
				["<A-l>"] = require("smart-splits").resize_right,
				-- moving between splits
				["<C-h>"] = require("smart-splits").move_cursor_left,
				["<C-j>"] = require("smart-splits").move_cursor_down,
				["<C-k>"] = require("smart-splits").move_cursor_up,
				["<C-l>"] = require("smart-splits").move_cursor_right,
			}

			for key, value in pairs(maps) do
				vim.keymap.set("n", key, value)
				vim.keymap.set("t", key, value)
			end
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			"gcc",
			"gbc",
			{ "gc", mode = "v" },
			{ "gb", mode = "v" },
		},
	},
}
