-- "Focus" mode

local opt = vim.opt
local api = vim.api
local keymap = vim.keymap

local active = false
local function focus_toggle()
    active = not active
    --opt.colorcolumn = active and "" or "100"
    opt.conceallevel = active and 2 or 0
    -- opt.foldcolumn = active and "0" or "1"
    -- opt.list = not active
    opt.number = not active
    opt.relativenumber = not active

    require("twilight").toggle()
end
api.nvim_create_user_command("Focus", focus_toggle, {})
keymap.set("n", "<leader>z", focus_toggle)

return {
    focus_toggle,
}
