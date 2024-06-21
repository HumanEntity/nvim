local function setup_colors(theme)
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
    }

    utils:clear_group(toclear)
end

return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("solarized-osaka").setup({
                transparent = true,
            })
            setup_colors("solarized-osaka")
        end,
    },
}
