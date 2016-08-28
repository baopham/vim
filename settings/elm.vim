" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

" YouCompleteMe
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

autocmd FileType elm setl sts=2 sw=2 expandtab
