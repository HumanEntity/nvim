local M = {
    enabled = false,
}

function M:toggle()
    self.enabled = not self.enabled
    vim.opt.cursorline = self.enabled
    vim.opt.cursorcolumn = self.enabled
end

function M:setup(opts)
    vim.keymap.set("n", opts.key, function()
        self:toggle()
    end)
end

return M
