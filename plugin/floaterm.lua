local state = {
    type = "none",
    floating = { buf = -1, win = -1 },
}

local function buf_aucmd(buf)
    vim.api.nvim_create_autocmd("BufHidden", {
        buffer = buf,
        callback = function()
            state.type = "none"
        end,
    })
end

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.width or math.floor(vim.o.lines * 0.8)

    -- Calculate position to center window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)
    buf_aucmd(buf)

    return { buf = buf, win = win }
end

local function create_split_window(opts)
    opts = opts or {}
    local width = vim.o.columns
    local height = vim.o.lines

    local split = "below"
    if width > height then
        split = "right"
    end

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        split = split,
        -- relative = "editor",
        -- width = width,
        -- height = height,
        -- col = col,
        -- row = row,
        style = "minimal",
        -- border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)
    buf_aucmd(buf)

    return { buf = buf, win = win }
end

-- state.floating = open_floaterm()
-- print(vim.inspect(state.floating))

local function toggle_floating()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.type = "floating"
        state.floating = create_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
        state.type = "none"
    end
end

local function toggle_split()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.type = "split"
        state.floating = create_split_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.term()
        end
    else
        vim.api.nvim_win_hide(state.floating.win)
        state.type = "none"
    end
end

local function toggle_term(args)
    if not args.bang then
        if state.type == "split" then
            toggle_split()
            print("Closing split")
        end
        toggle_floating()
    else
        if state.type == "floating" then
            toggle_floating()
        end
        toggle_split()
    end
end

vim.api.nvim_create_user_command("Floaterm", toggle_term, { bang = true })
