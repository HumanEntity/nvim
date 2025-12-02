Statusline = {}

local modes = {
    ["n"] = "normal",
    ["no"] = "normal (Operator-pending)",
    ["nov"] = "normal (Operator-pending (forced charwise |o_v|))",
    ["noV"] = "normal (Operator-pending (forced linewise |o_V|))",
    ["noCTRL-V"] = "normal (Operator-pending (forced blockwise |o_CTRL-V|) CTRL-V is one character)",
    ["niI"] = "-- (insert) --",
    ["niR"] = "-- (replace) --",
    ["niV"] = "-- (virtual replace) --",
    ["nt"] = "Normal in |terminal-emulator| (insert goes to Terminal mode)",
    ["ntT"] = "Normal using |t_CTRL-_CTRL-O| in |Terminal-mode|",

    ["v"] = "visual",
    ["vs"] = "visual select",
    ["V"] = "visual line",
    ["Vs"] = "visual select line",
    ["CTRL-V"] = "visual block",
    ["CTRL-Vs"] = "visual select block",

    ["s"] = "select",
    ["S"] = "select line",
    ["CTRL-S"] = "select block",

    ["i"] = "insert",
    ["ic"] = "insert completion",
    ["ix"] = "insert completion",

    ["R"] = "replace",
    ["Rc"] = "replace completion",
    ["Rx"] = "replace completion",
    ["Rv"] = "virtual replace",
    ["Rvc"] = "virtual replace completion",
    ["Rvx"] = "virtual replace completion",

    ["c"] = "command",
    ["cr"] = "command overstrike",
    ["cv"] = "ex",
    ["cvr"] = "ex overstrike",

    ["r"] = "prompt",
    ["rm"] = "long prompt",
    ["r?"] = "confirm prompt",
    ["!"] = "external command",
    ["t"] = "terminal",
}

local mode = function()
    return string.format(" %s ", modes[vim.api.nvim_get_mode().mode]):lower()
end

local filepath = function()
    local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
    if fpath == "" or fpath == "." then
        return " "
    end

    return string.format(" %%<%s/", fpath)
end

local filename = function()
    local fname = vim.fn.expand("%:t")

    if fname == "" then
        return ""
    end

    if vim.bo.modified == true then
        fname = "%#MatchParen#" .. fname .. "%#Statusline#"
    end

    return fname .. " "
end

local filetype = function()
    return string.format(" %s ", vim.bo.filetype)
end

local lineinfo = function()
    return " %P %l:%c "
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained" }, {
    callback = function()
        vim.b.branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    end,
})

local branch_name = function()
    local branch = vim.b.branch_name
    if branch ~= "" then
        return " " .. branch
    else
        return ""
    end
end

local lsp = function()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = " %#DiagnosticSignError#E" .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = " %#DiagnosticSignWarn#W" .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = " %#DiagnosticSignHint#H" .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = " %#DiagnosticSignInfo#I" .. count["info"]
    end

    return errors .. warnings .. hints .. info .. "%#Statusline# "
end

Statusline.active = function()
    return table.concat({
        "%#ModeMsg#",
        mode(),
        "%#Statusline#",
        filepath(),
        filename(),
        lsp(),
        "%#NvimNumber#",
        branch_name(),
        "%#Statusline#",

        "%=",
        filetype(),
        lineinfo(),
    })
end

Statusline.inactive = function()
    return ""
end

-- Setup autocommands

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

vim.opt_global.statusline = "%!v:lua.Statusline.active()"
vim.opt.laststatus = 3

-- vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
--     group = group,
--     desc = "Activate statusline",
--     callback = function(args)
--         vim.opt_local.statusline = "%!v:lua.Statusline.active()"
--     end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
--     group = group,
--     desc = "Deactivate statusline",
--     callback = function(args)
--         vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
--     end,
-- })
