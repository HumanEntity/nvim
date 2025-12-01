" Vim syntax file for qbe ir

if exists("b:current_syntax")
    finish
endif

syn keyword basicKeywords function export data

syn keyword instructions add and div mul neg or rem sar shl shr sub udiv urem xor 
syn keyword instructions alloc16 alloc4 alloc8 blit loadd loadl loads loadsb loadsh loadsw loadub loaduh loaduw loadw storeb stored storeh storel stores storew  
syn keyword instructions ceqd ceql ceqs ceqw cged cges cgtd cgts cled cles cltd clts cned cnel cnes cnew cod cos csgel csgew csgtl csgtw cslel cslew csltl csltw cugel cugew cugtl cugtw culel culew cultl cultw cuod cuos  
syn keyword instructions dtosi dtoui exts extsb extsh extsw extub extuh extuw sltof ultof stosi stoui swtof uwtof truncd  
syn keyword instructions cast copy 
syn keyword instructions call
syn keyword instructions vastart vaarg
syn keyword instructions phi
syn keyword instructions hlt jmp jnz ret

syn match global "\$\w\+"
syn match label "@\w\+"
syn match local "%\w\+"

syn match comment "#.*"

syn match integer "\d\+"
syn match integer "-\d\+"

syn match floating "s_\d\+"
syn match floating "-[sd]_\d\+"
syn match floating "[sd]_\d\+.\d\+"
syn match floating "-[sd]_\d\+.\d\+"

syn match string "\".*\""

syn match nonAlphabetic "[^\w]" contained

" syn match datatype "[^\w][wlb][^\w]" contains=nonAlphabetic
syn keyword datatype w l s d b h

" Highlights

hi def link basicKeywords Keyword
hi def link instructions Statement 

hi def link global Function
hi def link label Label
hi def link local Constant

hi def link datatype Type

hi def link integer Number
hi def link floating Number
hi def link string String

hi def link commment Comment
