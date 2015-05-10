let g:airline_theme='hybridline'
let g:airline_powerline_fonts=1

"  powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'

" Powerline's hard dividers don't look so good in iTerm with some transparency
if !has('gui_running')
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endif

let g:airline#extensions#whitespace#trailing_format = 'trailing:%s'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent:%s'

let g:airline#extensions#eclim#enabled = 1

" Change default modified indicator to just '+' with color red.
" See: https://github.com/bling/vim-airline/issues/316
function! Init()
  call airline#parts#define_raw('modified', '%{&modified ? " +" : ""}')
  call airline#parts#define_accent('modified', 'red')
  let g:airline_section_c = airline#section#create(['%f', 'modified'])
endfunction

autocmd VimEnter * call Init()

