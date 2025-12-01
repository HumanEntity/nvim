local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("zig", { s("th", { t("@This()") }) })

ls.add_snippets("zig", { s("imp", { t('@import("'), i(1), t('")') }) })
