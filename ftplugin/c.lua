vim.bo.tabstop = 8
vim.bo.softtabstop = 8
vim.bo.shiftwidth = 8

vim.opt_local.formatoptions:remove("r")

-- vim.g.setup_colors("gruvbox")

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("c", {
    s("raylibmain", {
        t({
            "#include <raylib.h>",
            "#include <stdio.h>",
            "#include <stdlib.h>",
            "",
            "#define SCREEN_WIDTH 800",
            "#define SCREEN_HEIGHT 450",
            '#define SCREEN_TITLE "Title"',
            "",
            "int",
            "main () {",
            "\tInitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_TITLE);",
            "\t",
            "\twhile (!WindowShouldClose()) {",
            "\t\tBeginDrawing();",
            "\t\t",
            "\t\t",
            "\t\tEndDrawing();",
            "\t}",
            "\t",
            "\tCloseWindow();",
            "\treturn 0;",
            "}",
        }),
    }),
})

ls.add_snippets("c", {
    s("sti", {
        t({
            "#include <stdio.h>",
            "#include <stdlib.h>",
            "#include <stdbool.h>",
        }),
    }),
})

ls.add_snippets("c", {
    s("stt", {
        t({
            "#include <stdio.h>",
            "#include <stdlib.h>",
            "#include <stdbool.h>",
            "#include <stdint.h>",
            "",
            "typedef int8_t s8;",
            "typedef int16_t s16;",
            "typedef int32_t s32;",
            "typedef int64_t s64;",
            "",
            "typedef uint8_t u8;",
            "typedef uint16_t u16;",
            "typedef uint32_t u32;",
            "typedef uint64_t u64;",
            "",
            "typedef float f32;",
            "typedef double f64;",
        }),
    }),
})
