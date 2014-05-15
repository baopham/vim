set autoindent
set expandtab
set shiftwidth=4
set numberwidth=4
set softtabstop=4
"set smartindent
autocmd FileType ruby,php,vim,jade,css,html,coffee,javascript setlocal expandtab sta sw=2 sts=2
au FileType xml exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"
set backspace=indent,eol,start

" Command to set how many spaces
command! -nargs=1 SetSpace call s:SetSpace(<f-args>)
function! s:SetSpace(space)
  setlocal expandtab sta
  let &sw = a:space
  let &sts = a:space
endfunction
