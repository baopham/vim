" Let SuperTab decide which completion mode to use and should play well with OmniCompletion:
let g:SuperTabDefaultCompletionType = "context"
" Close preview window when completion is finished or canceled
let g:SuperTabClosePreviewOnPopupClose = 1
" Completion chaining
autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
\ endif
