set tabstop=4 " a tab is four spaces
set smarttab
set softtabstop=4
set shiftwidth=4
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab
set autoindent
set copyindent

set backspace=indent,eol,start

autocmd FileType eruby,ruby,vim,jade,erb,css,scss,less,html,coffee,javascript setlocal sts=2 sw=2 expandtab
au FileType xml exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"

" Command to set how many spaces
command! -nargs=1 SetSpace call s:SetSpace(<f-args>)
function! s:SetSpace(space)
  setlocal expandtab
  let &sw = a:space
  let &sts = a:space
endfunction
