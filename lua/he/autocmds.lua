-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("all", {clear = true}),
-- 	pattern = "main.rs",
-- 	callback = function()
-- 		local buf= vim.api.nvim_create_buf(false, false)
-- 		vim.fn.jobstart({"cargo", "run"}, {
-- 			stdout_buffered= true,
-- 			stderr_buffered= true,
-- 			on_stdout= function(_, data)
-- if data then
-- 					vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
-- 				end
-- 			end,
--})
-- 		local win= vim.api.nvim_open_win(buf, 0, {relative = "win", row = 3, col = 3, width = 12, height = 3})
-- 	end,
--})

local autocmd = vim.api.nvim_create_autocmd
local HeGroup = vim.api.nvim_create_augroup("HeGroup", {})

local formattingGroup = vim.api.nvim_create_augroup("HeFormatting", {})

autocmd("BufWritePre", {
    pattern = "*.odin",
    group = HeGroup,
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
autocmd("BufWritePre", {
    pattern = "*.rs",
    group = HeGroup,
    callback = function()
        vim.lsp.buf.format()
    end,
})

autocmd("TextYankPost", {
    group = HeGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- autocmd({ "BufWritePre" }, {
--   group = HeGroup,
--   pattern = "*",
--   command = [[%s/\s\+$//e]],
-- })

autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "netrw",
    group = HeGroup,
    callback = function()
        local keymap = vim.keymap.set
        keymap("n", ".", "gh", { buffer = true })

        keymap("n", "<TAB>", "mf", { buffer = true })
        keymap("n", "<S-TAB>", "mF", { buffer = true })
        -- keymap("n", ".", "gh", { buffer = true })
        keymap("n", "ff", "%:w<CR>:buffer #<CR>", { buffer = true })
        keymap("n", "fe", "R", { buffer = true })
        keymap("n", "fc", "mc", { buffer = true })
        keymap("n", "fC", "mtmc", { buffer = true })
        keymap("n", "fx", "mm", { buffer = true })
        keymap("n", "fX", "mtmm", { buffer = true })
        keymap("n", "f;", "mx", { buffer = true })
    end,
})

autocmd({ "LspAttach" }, {
    group = HeGroup,
    callback = function(args)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
        -- vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Goto References" })
        vim.keymap.set("n", "gr", Snacks.picker.lsp_references, { desc = "Goto References" })
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, { desc = "Hover info" })
        -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature info" })
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "diagnostic" })
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
        end, { desc = "Next diagnostic" })
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
        end, { desc = "Prev diagnostic" })
        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, { desc = "Code action" })
        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, { desc = "References" })
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, { desc = "Rename" })
        vim.keymap.set("n", "<C-q>", function()
            vim.diagnostic.setqflist({ open = true })
        end)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, { desc = "Signature help" })

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client:supports_method("textDocument/formatting", args.buf) and client.name ~= "lua_ls" then
            -- Null-ls/None-ls is configured elsewhere
            if client.name ~= "clangd" and client.name ~= "rust_analyzer" then
                print(client.name)
                -- print("Formatting on the way " .. client.name)
                vim.api.nvim_clear_autocmds({
                    group = formattingGroup,
                    buffer = args.buf,
                })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = formattingGroup,
                    buffer = args.buf,
                    callback = function()
                        -- print(client.name)
                        vim.lsp.buf.format({
                            bufnr = args.buf,
                            id = client.id,
                        })
                    end,
                })
            end
        end

        -- if vim.bo.filetype == "c" then
        --     local function file_exists(name)
        --         local f = io.open(name, "r")
        --         if f then
        --             io.close(f)
        --             return true
        --         else
        --             return false
        --         end
        --     end
        --
        --     vim.print(vim.lsp.buf.list_workspace_folders())
        --     local root = vim.lsp.buf.list_workspace_folders()[1]
        --     --require("lspconfig").util.root_pattern(".git", "build.zig", "zls.json")()
        --     vim.print(root)
        --     local build_zig = root .. "/build.zig"
        --
        --     if file_exists(build_zig) then
        --         local original = vim.api.nvim_win_get_buf(0)
        --         vim.cmd("vsplit " .. build_zig)
        --         vim.cmd("e!")
        --         vim.cmd("sleep")
        --         -- vim.api.nvim_win_set_buf(0, original)
        --     end
        -- end
    end,
})

autocmd({ "BufEnter" }, {
    group = HeGroup,
    pattern = { "*.h", "*.c" },
    callback = function()
        vim.bo.filetype = "cpp"
        -- print("change to c")
    end,
})

autocmd({ "BufEnter" }, {
    group = HeGroup,
    pattern = "*.norg",
    callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
    end,
})

-- autocmd({ "BufEnter", "BufNew" }, {
--     pattern = "*.h",
--     callback = function(opts)
--         if string.sub(vim.fn.fnamemodify(opts.file, ":~:."), 1, 8) == "include/" then
--             -- print("In source folder")
--             vim.keymap.set("n", ";;", function()
--                 local file = string.sub(vim.fn.fnamemodify(opts.file, ":~:.:r"), 9)
--                 vim.cmd(":e src/" .. file .. ".c")
--             end, { silent = true, buffer = opts.buf })
--             vim.keymap.set("n", ";v", function()
--                 local file = string.sub(vim.fn.fnamemodify(opts.file, ":~:.:r"), 9)
--                 vim.cmd(":rightbelow vsplit src/" .. file .. ".c")
--             end, { silent = true, buffer = opts.buf })
--         else
--             vim.keymap.set("n", ";;", ":e %<.c<CR>", { silent = true, buffer = opts.buf })
--             vim.keymap.set("n", ";v", ":rightbelow vsplit %<.c<CR>", { silent = true, buffer = opts.buf })
--         end
--     end,
-- })
--
-- autocmd({ "BufEnter", "BufNew" }, {
--     pattern = { "*.c" },
--     callback = function(opts)
--         if string.sub(vim.fn.fnamemodify(opts.file, ":~:."), 1, 4) == "src/" then
--             -- print("In source folder")
--             vim.keymap.set("n", ";;", function()
--                 local file = string.sub(vim.fn.fnamemodify(opts.file, ":~:.:r"), 5)
--                 if vim.fn.isdirectory("include") == 0 then
--                     vim.cmd(":e src/" .. file .. ".h")
--                 else
--                     vim.cmd(":e include/" .. file .. ".h")
--                 end
--             end, { silent = true, buffer = opts.buf })
--             vim.keymap.set("n", ";v", function()
--                 local file = string.sub(vim.fn.fnamemodify(opts.file, ":~:.:r"), 5)
--
--                 -- Open include folder only if it exists
--                 if vim.fn.isdirectory("include") == 0 then
--                     vim.cmd(":leftabove vsplit src/" .. file .. ".h")
--                 else
--                     vim.cmd(":leftabove vsplit include/" .. file .. ".h")
--                 end
--             end, { silent = true, buffer = opts.buf })
--         else
--             vim.keymap.set("n", ";;", ":e %<.h<CR>", { silent = true, buffer = opts.buf })
--             vim.keymap.set("n", ";v", ":leftabove vsplit %<.h<CR>", { silent = true, buffer = opts.buf })
--         end
--     end,
-- })

do
    -- autocmd({ "BufEnter" }, {
    --     pattern = { "*.c" },
    --     callback = function(args)
    --         local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
    --
    --         local line_count = 0
    --         for _, line in pairs(lines) do
    --             if line ~= "" then
    --                 line_count = line_count + 1
    --             end
    --         end
    --
    --         if line_count ~= 0 then
    --             return
    --         end
    --
    --         local name = vim.api.nvim_buf_get_name(args.buf)
    --
    --         local date = os.date("%d-%m-%Y")
    --         local creator = "he"
    --
    --         vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, {
    --             "/* ========================================================================",
    --             "   File:    " .. vim.fs.basename(name),
    --             "   Date:    " .. date,
    --             "   Creator: " .. creator,
    --             "   Copyright " .. os.date("%Y") .. ", HumanEntity, All rights reserved",
    --             "   ======================================================================== */",
    --         })
    --     end,
    -- })

    autocmd({ "BufEnter" }, {
        pattern = { "*.h" },
        callback = function(args)
            local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)

            local line_count = 0
            for _, line in pairs(lines) do
                if line ~= "" then
                    line_count = line_count + 1
                end
            end

            if line_count ~= 0 then
                return
            end

            local name = vim.api.nvim_buf_get_name(args.buf)
            local basename = vim.fs.basename(name)

            local date = os.date("%d-%m-%Y")
            local creator = "he"

            local header_guard, _ = string.gsub(basename, "%.", "_")
            header_guard = "_" .. string.upper(header_guard)

            vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, {
                "#ifndef " .. header_guard,
                -- "/* ========================================================================",
                -- "   File:    " .. basename,
                -- "   Date:    " .. date,
                -- "   Creator: " .. creator,
                -- "   Copyright " .. os.date("%Y") .. ", HumanEntity, All rights reserved",
                -- "   ======================================================================== */",
                "#define " .. header_guard,
                "",
                "",
                "#endif /* " .. header_guard .. " */",
            })
        end,
    })
end

autocmd("VimResized", {
    pattern = "*",
    command = "wincmd=",
})
