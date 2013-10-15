" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i
" Don't comment blank lines
let g:tcommentBlankLines = 0
let g:tcomment_types = { 'asm' : '# %s' }
