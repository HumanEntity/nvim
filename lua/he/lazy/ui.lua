return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {

			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},

			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				timeout = 5000,
				background_colour = "#000000",
				render = "wrapped-compact",
			})
			vim.notify = require("notify")
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		config = function()
			local hi = require("mini.hipatterns")
			hi.setup({
				highlighters = {
					hsl_color = {
						pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
						group = function(_, match)
							local utils = require("solarized-osaka.hsl")
							--- @type string, string, string
							local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
							--- @type number?, number?, number?
							local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
							--- @type string
							local hex_color = utils.hslToHex(h, s, l)
							return hi.compute_hex_color_group(hex_color, "bg")
						end,
					},
					hex_color = hi.gen_highlighter.hex_color(),
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			vim.opt.showtabline = 1
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				dependencies = "neovim/nvim-lspconfig",
			},
			{
				"letieu/harpoon-lualine",
				dependencies = {
					{
						"ThePrimeagen/harpoon",
						branch = "harpoon2",
					},
				},
			},
		},
		opts = {
			options = {
				theme = "auto", --"solarized_dark",
				globalstatus = true,
			},
			sections = {
				lualine_c = {
					"harpoon2",
					function()
						return vim.fn["nvim_treesitter#statusline"](180)
					end,
				},
			},
		},
		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
}
