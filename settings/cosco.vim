autocmd FileType javascript,css,c,java nmap <silent> ;; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,c,java inoremap <silent> ;; <ESC>:call cosco#commaOrSemiColon()<CR>
