local function ColorMyPencils(theme)
  theme = theme or "rose-pine"
  vim.cmd.colorscheme(theme)

  local utils = require("he.utils")

  local toclear = {
    "Normal",
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

  utils:clear_group(toclear)
end

vim.g.setup_colors = ColorMyPencils

return {
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)

      -- ColorMyPencils("solarized-osaka")
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      tweak_background = {
        normal = "none",            -- main background
        telescope = "none",         -- telescope
        menu = "none",              -- nvim_cmp, wildmenu ... (bad idea to transparent)
        popup = "none",             -- lazy, mason, whichkey ... (bad idea to transparent)
      },
    },
    config = function(_, opts)
      require("lackluster").setup(opts)
      -- ColorMyPencils("lackluster")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,       -- add neovim terminal colors
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
      inverse = true,       -- invert background for search, diffs, statuslines and errors
      contrast = "",        -- can be "hard", "soft" or empty string
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
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })

      -- ColorMyPencils()
    end,
  },
  {
    "tjdevries/colorbuddy.nvim",
    -- lazy = false,
    config = function()
      -- ColorMyPencils("gruvbuddy")
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    -- lazy = false,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
      -- ColorMyPencils("nightfox")
    end,
  },
  {
    "Shatur/neovim-ayu",
    lazy = false,
    config = function()
      require("ayu").setup({
        mirage = false,          -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true,         -- Set to `false` to let terminal manage its own colors.
        overrides = {},          -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })
      -- ColorMyPencils("ayu")
    end,
  },
  {
    "drewtempelmeyer/palenight.vim",
    lazy = false,
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  --   opts = {
  --     options = {
  --       transparency = false,
  --     }
  --   }
  -- }
  {
    "navarasu/onedark.nvim",
    opts = {
      -- style = "darker",
      transparent = false,
    },
    lazy = false,
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
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },           -- add `blend = vim.o.pumblend` to enable transparency
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
  { "bluz71/vim-moonfly-colors",  name = "moonfly", lazy = false, priority = 1000 },
  { "marko-cerovac/material.nvim" },
}
