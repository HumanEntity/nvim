vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.qbe" },
    command = "set filetype=qbe",
})
