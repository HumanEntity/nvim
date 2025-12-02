local function ColorMyPencils(theme)
    theme = theme or "rose-pine"
    vim.cmd.colorscheme(theme)

    local utils = require("he.utils")

    local toclear = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "DiagnosticVirtualTextHint",
        "DiagnosticVirtualTextOk",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextWarn",
        "DiagnosticVirtualTextError",
        "TelescopeNormal",
        "TelescopeBorder",
        "NonText",

        "ColorColumn",
        "SignColumn",
        "Folded",
        "FoldColumn",
        "CursorLine",
        "CursorColumn",
        "VertSplit",
    }

    vim.api.nvim_set_hl(0, "CursorLineNr", { italic = true, bold = true })

    utils:clear_group(toclear)
end

vim.g.setup_colors = ColorMyPencils

return {
    {
        "craftzdog/solarized-osaka.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            transparent = false,
        },
        config = function(_, opts)
            require("solarized-osaka").setup(opts)

            -- ColorMyPencils("solarized-osaka")
        end,
    },
    {
        dir = "~/personal/plugins/gruvbox.nvim",
        -- "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = false,
            bold = true,
            italic = {
                strings = false,
                emphasis = true,
                comments = true,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = true,
            -- transparent_mode = true
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            -- ColorMyPencils("gruvbox")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        opts = {
            theme = "dragon",
            transparent = false,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },
                }
            end,
        },
        config = function(_, opts)
            require("kanagawa").setup(opts)
            -- vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        "tinted-theming/tinted-vim",
        config = function()
            -- Disable the bold
            vim.g.tinted_bold = 0
        end,
    },
    { "srcery-colors/srcery-vim", name = "srcery" },
}
