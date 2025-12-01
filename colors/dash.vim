
" https://github.com/bitbrain/godot-dash

set background=dark
highlight clear
syntax reset

let g:colors_name = "dash"
let colors_name = "dash"

let s:white = "#ffffff"
let s:deep_blue = "#5b85ff" " Color(0.356863, 0.521569, 1, 1)
let s:deep_pink = "#f44683" " Color(0.960784, 0.278431, 0.517647, 1)
let s:slight_grey = "#dbe4ed" " Color(0.858824, 0.898039, 0.929412, 1) 
let s:grey = "#343d49" " Color(0.207843, 0.243137, 0.290196, 1)
let s:deep_green = "#4dbc6b" " Color(0.305882, 0.737255, 0.419608, 1)

let s:fg = s:white
let s:bg = "#0e1012" " Color(0.054902, 0.0627451, 0.0745098, 1)

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

call s:h("Normal",  s:fg, s:bg, "")

" Syntax
call s:h("Whitespace", s:non_text, "", "")
call s:h("NonText", s:non_text, "", "")
call s:h("Comment", s:comment, "", "italic")

" call s:h("Constant", s:blue, "", "")
call s:h("String", s:deep_green, "", "")
call s:h("Character", s:deep_green, "", "")
" call s:h("Number", s:yellow, "", "")
" call s:h("Boolean", s:yellow, "", "")
" call s:h("Float", s:yellow, "", "")

call s:h("Identifer", s:deep_blue, "", "")
call s:h("Function", s:white, "", "")
call s:h("Statement", s:deep_blue, "", "")

" call s:h("Conditional", s:blue, "", "")
" call s:h("Repeat", s:purple, "", "")
" call s:h("Label", s:purple, "", "")
" call s:h("Operator", s:purple, "", "")
" call s:h("Keyword", s:blue, "", "")
" call s:h("Exception", s:purple, "", "")

" call s:h("Type", s:yellow, "", "italic")
" call s:h("StorageClass", s:yellow, "", "italic")
" call s:h("Structure", s:yellow, "", "italic")
" call s:h("Typedef", s:yellow, "", "italic")

" call s:h("Special", s:yellow, "", "")
" call s:h("SpecialChar", s:yellow, "", "")
" call s:h("Delimiter", s:fg, "", "")
" call s:h("SpecialCmment", s:fg, "", "")
" call s:h("Todo", s:blue, "", "")
" call s:h("Error", s:red, s:gutter_bg, "")

" call s:h("Title", s:blue, "", "")

" text_editor/theme/highlighting/symbol_color = Color(1, 1, 1, 1)
" text_editor/theme/highlighting/keyword_color = Color(0.356863, 0.521569, 1, 1)
" text_editor/theme/highlighting/control_flow_keyword_color = Color(0.356863, 0.521569, 1, 1)"
" text_editor/theme/highlighting/base_type_color = Color(0.960784, 0.278431, 0.517647, 1)"
" text_editor/theme/highlighting/engine_type_color = Color(0.960784, 0.278431, 0.517647, 1)
" text_editor/theme/highlighting/user_type_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/theme/highlighting/comment_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/theme/highlighting/string_color = Color(0.305882, 0.737255, 0.419608, 1)
" text_editor/theme/highlighting/background_color = Color(0.054902, 0.0627451, 0.0745098, 1)

" text_editor/theme/highlighting/completion_background_color = Color(0.168627, 0.160784, 0.2, 1)
" text_editor/theme/highlighting/completion_selected_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/theme/highlighting/completion_font_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/theme/highlighting/text_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/theme/highlighting/line_number_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/theme/highlighting/safe_line_number_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/theme/highlighting/caret_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/theme/highlighting/brace_mismatch_color = Color(1, 0.270588, 0.329412, 1)
" text_editor/theme/highlighting/function_color = Color(1, 1, 1, 1)
" text_editor/theme/highlighting/member_variable_color = Color(1, 1, 1, 1)
" text_editor/theme/highlighting/bookmark_color = Color(0.388235, 0.482353, 0.772549, 1)
" text_editor/theme/highlighting/executing_line_color = Color(0.278431, 0.345098, 0.435294, 1)
" text_editor/theme/highlighting/search_result_color = Color(0.305882, 0.737255, 0.419608, 1)

" text_editor/highlighting/symbol_color = Color(1, 1, 1, 1)
" text_editor/highlighting/keyword_color = Color(0.356863, 0.521569, 1, 1)
" text_editor/highlighting/base_type_color = Color(0.960784, 0.278431, 0.517647, 1)
" text_editor/highlighting/engine_type_color = Color(0.960784, 0.278431, 0.517647, 1)
" text_editor/highlighting/user_type_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/highlighting/comment_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/highlighting/string_color = Color(0.305882, 0.737255, 0.419608, 1)
" text_editor/highlighting/completion_selected_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/highlighting/completion_existing_color = Color(0.262745, 0.772549, 0.898039, 1)
" text_editor/highlighting/completion_font_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/highlighting/text_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/highlighting/line_number_color = Color(0.207843, 0.243137, 0.290196, 1)
" text_editor/highlighting/safe_line_number_color = Color(0.360784, 0.411765, 0.478431, 1)
" text_editor/highlighting/caret_color = Color(0.858824, 0.898039, 0.929412, 1)
" text_editor/highlighting/brace_mismatch_color = Color(1, 0.270588, 0.329412, 1)
" text_editor/highlighting/line_length_guideline_color = Color(0.301961, 0.501961, 0.8, 0.101961)
" text_editor/highlighting/number_color = Color(0.929412, 0.611765, 0.313726, 1)
" text_editor/highlighting/function_color = Color(1, 1, 1, 1)
" text_editor/highlighting/member_variable_color = Color(1, 1, 1, 1)
" text_editor/highlighting/bookmark_color = Color(0.388235, 0.482353, 0.772549, 1)
" text_editor/highlighting/executing_line_color = Color(0.277491, 0.344485, 0.433811, 1)
" text_editor/highlighting/search_result_color = Color(0.305882, 0.737255, 0.419608, 1)
" text_editor/appearance/line_numbers_zero_padded = true
" text_editor/tools/sort_members_outline_alphabetically = true
