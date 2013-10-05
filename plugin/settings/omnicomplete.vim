" Change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item,
" but just inserts the longest common text of all matches
set completeopt=longest,menuone,preview

let OmniCpp_NamespaceSearch = 2 " search name spaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1

" Insert HTML/XML close tag with Option+Command+.
if has('gui_running')
  autocmd FileType xml,html setlocal macmeta " required for MacVim
endif
autocmd FileType xml,html imap <buffer> <M-D-.> </<C-X><C-O>
