return {
    {
        "tpope/vim-fugitive",
        --    enabled = false,     -- Developing custom plugin for that
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

            local HeFugitive = vim.api.nvim_create_augroup("HeFugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = HeFugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git("push")
                    end, opts)
                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git({ "pull", "--rebase" })
                    end, opts)

                    vim.keymap.set("n", "<leader>c", function()
                        vim.cmd.Git({ "commit" })
                    end, opts)

                    vim.keymap.set("n", "<leader>ff", function()
                        vim.cmd.Git({ "fetch" })
                    end, opts)
                    vim.keymap.set("n", "<leader>mm", function()
                        vim.cmd.Git({ "merge" })
                    end, opts)
                    vim.keymap.set("n", "<leader>rr", function()
                        vim.cmd.Git({ "rebase" })
                    end, opts)

                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)

                    vim.keymap.set("n", "q", function()
                        vim.cmd("bdelete")
                    end, opts)
                end,
            })
        end,
    },
}
