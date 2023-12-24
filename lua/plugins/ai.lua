return {
	{
		"huynle/ogpt.nvim",
		cmd = { "OGPT", "OGPTRun", "OGPTActAs" },
		config = function()
			require("ogpt").setup({
				openai_params = {
					model = "mistral:instruct",
				},
				openai_edit_params = {
					model = "mistral:instruct",
				},
			})
		end,
	},
	{ "David-Kunz/gen.nvim" },
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
}
