" jblow.vim - A Vim color scheme based on Jonathan Blow's theme

" Clear existing highlights
hi clear
if exists("syntax_on")
  syntax reset
endif

set background=dark

" Name the colorscheme
let g:colors_name = "jblow"

" --- UI Elements ---
" General editor colors
hi Normal guibg=#031c1f guifg=#bdb395
hi Cursor guibg=#86E08F guifg=#000000
hi CursorLine guibg=NONE
hi Visual guibg=#0000FF guifg=#e0dede
hi Search guibg=#63878a
hi LineNr guifg=#b59e7a
hi CursorLineNr guifg=#b59E7A

" Tab line
hi TabLine guibg=#042327 guifg=#CCCCCC
hi TabLineSel guibg=#093136 guifg=#FFFFFF
hi TabLineFill guibg=#052c31

" Status line
hi StatusLine guibg=#B59E7A guifg=#000000
hi StatusLineNC guibg=#B59E7A guifg=#000000

" Popup menu (e.g., autocompletion)
hi Pmenu guibg=#2A343E guifg=#CCCCCC
hi PmenuSel guibg=#b59e7a guifg=#CCCCCC

" Scrollbar approximation
hi ScrollBar guibg=#b59e7a

" Vertical split
hi VertSplit guibg=#052c31 guifg=#052c31

" List and selection highlights
hi VisualNOS guibg=#63878a

" --- Syntax Highlighting ---
hi Error guifg=#FF0000

" Functions and related (mapped from multiple scopes like meta.function, meta.function-call)
hi Function guifg=#bdb395

" Types and parameters (storage.type.function, entity.name.type, variable.parameter, etc.)
hi Type guifg=#b7cadd
hi Identifier guifg=#b7cadd

" HTML tags, CSS classes, Rust mods, etc.
hi Structure guifg=#9DE3C0

" Comments
hi Comment guifg=#31B72C

" Keywords
hi Keyword guifg=#CCCCCC

" Variables
hi Identifier guifg=#A5B5BC

" Storage and types
hi StorageClass guifg=#9DE3C0

" Strings
hi String guifg=#2ca198

" Constants
hi Constant guifg=#70c5bf
