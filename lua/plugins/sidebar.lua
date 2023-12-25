return {
	{
		"preservim/tagbar",
		cmd = "TagbarToggle",
		keys = {
			{
				"<F12>",
				function()
					vim.cmd(":TagbarToggle<CR>")
					vim.cmd([[call nvim_feedkeys(g:tagbar_focus_key, 'n', v:false)]])
					-- vim.api.feed_keys(key, "n", false)
				end,
			},
			{ "<F11>", ":TagbarToggle<CR>" },
		},
	},
}
