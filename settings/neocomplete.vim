let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1

" <TAB>: completion.
imap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
smap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
imap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
smap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
