return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        keys = {
            "gcc",
            "gbc",
            { "gc", mode = "v" },
            { "gb", mode = "v" },
        },
    },
    {
        "folke/snacks.nvim",
        lazy = false,
        opts = {
            picker = {},
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            input = { enabled = true },
            image = { enabled = true },
        },
        config = function(_, opts)
            require("snacks").setup(opts)

            local map = require("he.utils").map
            local picker = Snacks.picker

            map("n", "<leader>fb", picker.buffers, { desc = "Buffers" })
            map("n", "<leader>pf", picker.files, { desc = "Find files" })
            map("n", "<leader>pws", function()
                local word = vim.fn.expand("<cword>")
                picker.grep({ cmd = word })
                -- builtin.grep_string({ search = word })
            end, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>pWs", function()
                local word = vim.fn.expand("<cWORD>")
                picker.grep({ cmd = word })
                -- builtin.grep_string({ search = word })
            end)
            -- Git
            vim.keymap.set("n", "<leader>ps", function()
                local word = vim.fn.input("Grep > ")
                picker.grep({ args = { word } })
            end)
            vim.keymap.set("n", "<leader>vh", picker.help, {})

            map("n", "<C-p>", function()
                local status = false -- pcall(builtin.git_files)

                if not status then
                    picker.files()
                    -- builtin.find_files()
                end
            end, { desc = "Git files" })
            map("n", "<leader><C-p>", function()
                vim.cmd("rightbelow vsplit")
                local status = false -- pcall(builtin.git_files)

                if not status then
                    picker.files()
                end
            end, { desc = "Git files" })
        end,
    },
}
