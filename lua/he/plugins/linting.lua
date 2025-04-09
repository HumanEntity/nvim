return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufWritePre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            -- ["c"] = { "clangtidy" },
        }

        local augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
