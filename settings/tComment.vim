" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i
" Don't comment blank lines
let g:tcommentBlankLines = 0
