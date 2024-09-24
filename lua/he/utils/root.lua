local M = {}

M.cache = {}

function M.get(opts)
    opts = opts or {}
    local buf = opts.buf or vim.api.nvim_get_current_buf()
    local ret = M.cache[buf]
    if not ret then
        local root_patterns = { ".git", ".clang-format", "pyproject.toml", "setup.py" }
        ret = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
        M.cache[buf] = ret
    end
    if opts and opts.normalize then
        return ret
    end
    return ret
end

function M.git()
    local root = M.get()
    local git_root = vim.fs.find(".git", { path = root, upward = true })[1]
    local ret = git_root and vim.fn.fnamemodify(git_root, ":h") or root
    return ret
end

function M.cwd()
    return M.realpath(vim.uv.cwd()) or ""
end

function M.realpath(path)
    if path == "" or path == nil then
        return nil
    end
    path = vim.uv.fs_realpath(path) or path
    return path -- LazyVim.norm(path)
end

return M
