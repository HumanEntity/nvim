return {
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
                        -- function()
                        --     return vim.fn["nvim_treesitter#statusline"](30)
                        -- end,
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
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
            }
        end,
    },
}
