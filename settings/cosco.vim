autocmd FileType javascript,css,c,java,php nmap <silent> ;; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,c,java,php inoremap <silent> ;; <ESC>:call cosco#commaOrSemiColon()<CR>
