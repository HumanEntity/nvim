local FileLastModified = {
	-- did you know? Vim is full of functions!
	flexible = 1,
	{

		provider = function()
			local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
			return (ftime > 0) and os.date("%c", ftime)
		end,
	},
	{
		provider = "",
	},
}

return FileLastModified
