" Vim syntax file for lingo

if exists("b:current_syntax")
    finish
endif

syn keyword basicKeywords let

" Highlights

hi def link basicKeywords Keyword
