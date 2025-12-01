return {
    {
        "nvim-mini/mini.nvim",
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
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = function()
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        require("he.utils.lualine").root_dir(),
                        {
                            "diagnostics",
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = " ",
                            },
                        },
                        {
                            "filetype",
                            icon_only = true,
                            separator = "",
                            padding = { left = 1, right = 0 },
                        },
                        { require("he.utils.lualine").pretty_path() },
                        function()
                            return vim.fn["nvim_treesitter#statusline"](50)
                        end,
                        function()
                            local reg = vim.fn.reg_recording()
                            if reg == "" then
                                return ""
                            end -- not recording
                            return "recording to " .. reg
                        end,
                    },
                    lualine_x = {
                        {
                            "diff",
                            symbols = {
                                added = "+",
                                modified = "~",
                                removed = "-",
                            },
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_y = {
                        { "progress", separator = " ", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    -- lualine_z = {
                    --   function()
                    --     return " " .. os.date("%R")
                    --   end,
                    -- },
                },
            }
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                enabled = true, -- enables the Noice cmdline UI
                view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                opts = {}, -- global options for the cmdline. See section on views
                format = {
                    -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
                    -- view: (default is cmdline view)
                    -- opts: any options passed to the view
                    -- icon_hl_group: optional hl_group for the icon
                    -- title: set to anything or empty string to hide
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                    input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
                    -- lua = false, -- to disable a format, set to `false`
                },
            },
            routes = {
                {
                    filter = {
                        event = "notify",
                        find = "No information available",
                    },
                    opts = { skip = true },
                },
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup({
                        background_colour = "#000000",
                    })
                end,
            },
        },
    },
}
