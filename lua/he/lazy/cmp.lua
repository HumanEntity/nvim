return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
			}, -- Required
			{
				"onsails/lspkind.nvim",
				lazy = true,
				opts = {
					mode = "symbol_text",
					symbol_map = {
						Array = "󰅪",
						Boolean = "⊨",
						Key = "󰌆",
						Namespace = "󰅪",
						Null = "NULL",
						Number = "#",
						Object = "󰀚",
						Package = "󰏗",
						Reference = "",
						String = "󰀬",
						TypeParameter = "󰊄",
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "",
						Unit = "",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
					},
					menu = {},
				},
				config = function(_, opts)
					require("lspkind").init(opts)
				end,
			},
			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup({})
				end,
				lazy = false,
			},
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local utils = require("he.utils")

			local function border(hl_name)
				return {
					{ "╭", hl_name },
					{ "─", hl_name },
					{ "╮", hl_name },
					{ "│", hl_name },
					{ "╯", hl_name },
					{ "─", hl_name },
					{ "╰", hl_name },
					{ "│", hl_name },
				}
			end

			require("luasnip.loaders.from_vscode").lazy_load()

			local lspkind = require("lspkind")

			cmp.setup({
				formatting = {
					fields = {
						cmp.ItemField.Abbr,
						cmp.ItemField.Kind,
						cmp.ItemField.Menu,
					},

					-- fields = { "abbr", "kind", "menu" },
					-- format = function(entry, vim_item)
					-- 	--vim_item.kind = cmp_kinds[vim_item.kind] or ""
					-- 	--local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					-- 	--local strings = vim.split(kind.kind, "%s", { trimempty = true })
					-- 	vim_item.menu = "    (" .. (vim_item.kind or "") .. ")" .. " [" .. (entry.source.name or "") .. "]"
					-- 	vim_item.kind = " " .. (cmp_kinds[vim_item.kind] or "") .. " "
					--
					-- 	print("Hello")
					--
					-- 	return vim_item
					-- end,
					format = lspkind.cmp_format(utils.plugin_opts("lspkind")),
				},
				mapping = {
					["<S-Tab>"] = cmp.mapping.select_next_item(cmp_select),
					["<Tab>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
					["<C-Space>"] = cmp.mapping.complete(),
				},
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "buffer", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 2 },
					-- { name = "codeium" },
					-- { name = "orgmode" },
					{ name = "crates" },
				}),
				window = {
					documentation = {
						border = border("CmpDocBorder"),
						winhighlight = "Normal:CmpDoc",
					},
					completion = {
						border = border("CmpBorder"),
						winhighlight = "Normal:CmpPmenu,Search:PmenuSel,CursorLine:PmenuSel",
						-- scrollbar = false,
					},
				},
				completion = {
					border = border("CmpBorder"),
					completeopt = "menu,menuone,noinsert",
				},
			})
		end,
		lazy = false,
	},
}
