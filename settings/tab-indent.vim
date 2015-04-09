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

" Command to set tabs width
command! -nargs=1 SetTab call s:SetTab(<f-args>)
function! s:SetTab(width)
  setlocal noexpandtab
  let &tabstop= a:width
endfunction

command! SetLaravelSession call s:SetLaravelSession()
function! s:SetLaravelSession()
  let &tabstop=4
  autocmd FileType html setl sts=4 sw=4 expandtab
  autocmd FileType php,javascript setl sts=4 sw=4 expandtab comments=sr:/**,m:*\ ,ex:*/,:// formatoptions+=croql formatoptions-=t
  autocmd FileType css,scss setlocal sts=2 sw=2 expandtab
  autocmd BufRead,BufNewFile,BufEnter package.json,bower.json,.travis.yml setl sts=2 sw=2 expandtab
endfunction
