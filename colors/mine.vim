" ============================================
"   Name:       Mine
"   Author:     Tomasz Kolorz
"   Url:        NONE
"   License:    The MIT License (MIT)
"
"   A dark vim theme
" ============================================

set background=dark
highlight clear
syntax reset

let g:colors_name="mine"
let colors_name="mine"

let s:black = "#000000"   " "#181818"
let s:red   = "#e06c75"
let s:green = "#98c379"
let s:yellow = "#e5c07b"
let s:blue  = "#61afef"
let s:purple = "#c678dd"
let s:cyan = "#56b6c2"
let s:white = "#eaeaea"

let s:bg = s:black
let s:fg = s:white

let s:non_text      = "#373C45"
let s:comment       = "#ffe8a6"
let s:gutter_bg     = s:black
let s:gutter_fg     = "#4c5157"
let s:cursor_line   = "#181818"

let s:selection     = "#222222"

function! s:h(group, ...)
    exec "hi " . a:group " NONE"
    if a:0 >= 1 && strlen(a:1)
        exec "hi " . a:group . " guifg=" . a:1
        " . ' ctermfg=' . a:fg
    endif
    if a:0 >= 2 && strlen(a:2)
        exec 'hi ' . a:group . ' guibg=' . a:2
        " . ' ctermbg=' . a:bg
    endif
    if a:0 >= 3 && strlen(a:3)
        exec "hi " . a:group " gui=" . a:3
    else
        exec "hi " . a:group " gui=NONE"
    endif

    if a:0 >= 4 && strlen(a:4)
        exec "hi " . a:group "guisp= " . a:4
    endif
endfun

" User interface
call s:h("Normal",  s:fg, s:bg, "")

call s:h("Cursor",  s:blue, s:bg, "")
call s:h("CursorColumn",  "", s:cursor_line)
call s:h("CursorLine",  "", s:cursor_line)
call s:h("ColorColumn",  "", s:cursor_line)

call s:h("LineNr",  s:gutter_fg, s:gutter_bg, "")
call s:h("CursorLineNr",  s:fg, "", "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", s:yellow, "", "")
call s:h("DiffDelete", s:red, "", "")
call s:h("DiffText", s:blue, "", "")

call s:h("IncSearch", s:bg, s:yellow)
call s:h("Search", s:bg, s:yellow)

call s:h("Pmenu", s:fg, s:bg)
call s:h("PmenuSel", s:fg, s:blue)
call s:h("PmenuSbar")
call s:h("PmenuThumb")

call s:h("StatusLine", s:blue, s:cursor_line)
call s:h("StatusLineNC", s:cursor_line, s:bg)

call s:h("Visual", "", s:selection)
call s:h("VisualNOS", "", s:selection)

" Git Signs
call s:h("GitSignsAdd", s:green, "", "")
call s:h("GitSignsChange", s:yellow, "", "")
call s:h("GitSignsDelete", s:red, "", "")
call s:h("GitSignsText", s:blue, "", "")

call s:h("ErrorMsg", s:red, "", "")
call s:h("ModeMsg", s:blue, "", "")
call s:h("MoreMsg", s:fg, "", "")
call s:h("WarningMsg", s:yellow, "", "")
call s:h("Question", s:blue, "", "")


" Diagnostics
call s:h("DiagnosticError", s:red, "", "")
call s:h("DiagnosticWarn", s:yellow, "", "")
call s:h("DiagnosticInfo", s:blue, "", "")
call s:h("DiagnosticHint", s:purple, "", "")
call s:h("DiagnosticOk", s:green, "", "underline")

call s:h("DiagnosticUnderlineError", "", "", "underline", s:red)
call s:h("DiagnosticUnderlineWarn", "", "", "underline", s:yellow)
call s:h("DiagnosticUnderlineInfo", "", "", "underline", s:blue)
call s:h("DiagnosticUnderlineHint", "", "", "underline", s:purple)
call s:h("DiagnosticUnderlineOk", "", "", "underline", s:green)

" Syntax colors
call s:h("Whitespace", s:non_text, "", "")
call s:h("NonText", s:non_text, "", "")
call s:h("Comment", s:comment, "", "italic")

call s:h("Constant", s:blue, "", "")
call s:h("String", s:green, "", "")
call s:h("Character", s:green, "", "")
call s:h("Number", s:yellow, "", "")
call s:h("Boolean", s:yellow, "", "")
call s:h("Float", s:yellow, "", "")

call s:h("Identifer", s:cyan, "", "")
call s:h("Function", s:red, "", "")
call s:h("Statement", s:blue, "", "")

call s:h("Conditional", s:blue, "", "")
call s:h("Repeat", s:purple, "", "")
call s:h("Label", s:purple, "", "")
call s:h("Operator", s:purple, "", "")
call s:h("Keyword", s:blue, "", "")
call s:h("Exception", s:purple, "", "")

call s:h("Type", s:yellow, "", "italic")
call s:h("StorageClass", s:yellow, "", "italic")
call s:h("Structure", s:yellow, "", "italic")
call s:h("Typedef", s:yellow, "", "italic")

call s:h("Special", s:yellow, "", "")
call s:h("SpecialChar", s:yellow, "", "")
call s:h("Delimiter", s:fg, "", "")
call s:h("SpecialCmment", s:fg, "", "")
call s:h("Todo", s:blue, "", "")
call s:h("Error", s:red, s:gutter_bg, "")

call s:h("Title", s:blue, "", "")
