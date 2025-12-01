vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.lgo", "*.lingo" },
    command = "set filetype=lingo",
})
