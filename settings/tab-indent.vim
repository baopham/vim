set smartindent
set cindent
" set smarttab " make tab insert indents instead of tabs at the beginning of a line
set tabstop=8
set shiftwidth=4
set softtabstop=4
set numberwidth=4
set backspace=indent,eol,start
set expandtab " always uses spaces instead of tab characters

autocmd FileType eruby,ruby,php,vim,jade,erb,css,scss,html,coffee,javascript,php.drupal,javascript.drupal,*.drupal setlocal tabstop=8 sts=2 sw=2 expandtab
au FileType xml exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"

" Command to set how many spaces
command! -nargs=1 SetSpace call s:SetSpace(<f-args>)
function! s:SetSpace(space)
  setlocal expandtab
  let &sw = a:space
  let &ts = 8
  let &sts = a:space
endfunction
