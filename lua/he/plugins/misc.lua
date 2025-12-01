return {
    {
        "AndrewRadev/dealwithit.vim",
        lazy = false,
    },
    {
        dir = "~/personal/plugins/typewriter/",
        event = "VeryLazy",
        enabled = false,

        config = function()
            -- vim.api.nvim_create_autocmd("InsertEnter", {
            --     pattern = { "*" },
            --     callback = function()
            --         require("typewriter").play_sound("~/personal/stuff/carriage1.wav", "0.1")
            --     end,
            -- })

            vim.api.nvim_create_autocmd("InsertLeave", {
                pattern = { "*" },
                callback = function()
                    require("typewriter").play_sound("~/personal/stuff/ding1.wav", "0.1")
                end,
            })

            local click_idx = 0

            vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
                group = vim.api.nvim_create_augroup("PlayMetalPipeOnBufferWrite", { clear = true }),
                pattern = { "*" },
                callback = function()
                    require("typewriter").play_sound("~/personal/stuff/click" .. (click_idx + 1) .. ".wav")
                    click_idx = (click_idx + 1) % 3
                end,
                desc = "Play a sound when a buffer is written to disk",
            })
        end,
    },
}
