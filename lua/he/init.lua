vim.loader.enable()
require("he.opts")
require("he.custom.focus")
require("he.custom.presentation"):setup({ key = "<leader>;p" })
require("he.lazy")
vim.g.setup_colors("lackluster-hack")
-- vim.g.setup_colors("vague")
require("he.autocmds")
require("he.mappings")
