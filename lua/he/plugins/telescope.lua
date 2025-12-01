return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    -- or                              , branch = '0.1.1',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
        })

        local map = require("he.utils").map
        local builtin = require("telescope.builtin")

        -- require("telescope").load_extension("file_browser")

        map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        map("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
        map("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        -- Git
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

        map("n", "<C-p>", function()
            local status = false -- pcall(builtin.git_files)

            if not status then
                builtin.find_files()
            end
        end, { desc = "Git files" })
        map("n", "<leader><C-p>", function()
            vim.cmd("rightbelow vsplit")
            local status = false -- pcall(builtin.git_files)

            if not status then
                builtin.find_files()
            end
        end, { desc = "Git files" })
    end,
    cmd = "Telescope",
    lazy = false,
    cond = false,
}
