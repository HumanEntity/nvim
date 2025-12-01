return {
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    --     config = function()
    --         local gitsigns = require("gitsigns")
    --
    --         gitsigns.setup({
    --             signs = {},
    --             signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
    --             numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    --             linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    --             word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    --             current_line_blame = true,
    --             current_line_blame_opts = {
    --                 virt_text = true,
    --                 virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    --                 delay = 1000,
    --                 ignore_whitespace = false,
    --             },
    --             -- current_line_blame_formatter_opts = {
    --             -- 	relative_time = false,
    --             -- },
    --         })
    --
    --         vim.keymap.set("n", "<C-s>h", gitsigns.stage_hunk)
    --         vim.keymap.set("n", "<C-s>b", gitsigns.stage_buffer)
    --         vim.keymap.set("n", "]h", gitsigns.next_hunk)
    --         vim.keymap.set("n", "[h", gitsigns.prev_hunk)
    --     end,
    -- },
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

                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)

                    -- vim.keymap.set("n", "q", function()
                    --     vim.cmd("q")
                    -- end, opts)
                end,
            })
        end,
    },
    -- {
    --   dir = "~/personal/plugins/git.nvim/",
    --   lazy = false,
    --   opts = {},
    -- },
    {
        "NeogitOrg/neogit",
        lazy = false,
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
        },
        opts = {
            kind = "split_below",
        },
        config = true,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("git-worktree").setup({})
            require("telescope").load_extension("git_worktree")

            vim.keymap.set("n", "<leader>gwc", function()
                require("telescope").extensions.git_worktree.create_git_worktree()
            end, { desc = "Create worktree" })
            vim.keymap.set("n", "<leader>gws", function()
                require("telescope").extensions.git_worktree.git_worktrees()
            end, { "List worktrees" })
        end,
        keys = {},
        -- cond = false,
    },
    {
        dir = "~/personal/plugins/jj/",
        opts = {},
        lazy = false,
    },
}
