return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  -- or                              , branch = '0.1.1',
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    -- local fb_actions = require("telescope").extensions.file_browser.actions

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        -- file_browser = {
        --   theme = "ivy",
        --   -- disables netrw and use telescope-file-browser in its place
        --   hijack_netrw = true,
        --   mappings = {
        --     -- your custom insert mode mappings
        --     ["n"] = {
        --       -- your custom normal mode mappings
        --       ["N"] = fb_actions.create,
        --       ["n"] = fb_actions.create,
        --       ["h"] = fb_actions.goto_parent_dir,
        --       -- ["l"] = fb_actions.change_cwd,
        --       ["/"] = function()
        --         vim.cmd("startinsert")
        --       end,
        --       ["<C-u>"] = function(prompt_bufnr)
        --         for i = 1, 10 do
        --           actions.move_selection_previous(prompt_bufnr)
        --         end
        --       end,
        --       ["<C-d>"] = function(prompt_bufnr)
        --         for i = 1, 10 do
        --           actions.move_selection_next(prompt_bufnr)
        --         end
        --       end,
        --       ["<PageUp>"] = actions.preview_scrolling_up,
        --       ["<PageDown>"] = actions.preview_scrolling_down,
        --     },
        --     ["i"] = {
        --       ["<C-h>"] = fb_actions.goto_parent_dir,
        --       ["<C-l>"] = fb_actions.change_cwd,
        --     },
        --   },
        -- },
      },
    })

    local map = require("he.utils").map
    local builtin = require("telescope.builtin")

    -- require("telescope").load_extension("file_browser")

    map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    map("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
    -- map("n", "<leader>pb", function()
    --   local telescope = require("telescope")
    --
    --   local function telescope_buffer_dir()
    --     return vim.fn.expand("%:p:h")
    --   end
    --
    --   telescope.extensions.file_browser.file_browser({
    --     path = "%:p:h",
    --     cwd = telescope_buffer_dir(),
    --     respect_gitignore = false,
    --     hidden = true,
    --     grouped = true,
    --     previewer = false,
    --     initial_mode = "normal",
    --     layout_config = { height = 40 },
    --   })
    -- end, { desc = "Open file browser at current directory" })
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
      local status = false       -- pcall(builtin.git_files)

      if not status then
        builtin.find_files()
      end
    end, { desc = "Git files" })
  end,
  cmd = "Telescope",
  lazy = false,
}
