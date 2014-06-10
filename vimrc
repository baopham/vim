"""""""""""""""""""""
" OS:  Mac OS       "
" GUI: MacVim       "
" Terminal: iTerm2  "
"""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

" File finder
Plugin 'kien/ctrlp.vim'
Plugin 'amiorin/ctrlp-z'
Plugin 'scrooloose/nerdtree'
Plugin 'baopham/vim-nerdtree-unfocus'
" Session manager, dependency: xolox/vim-misc
Plugin 'xolox/vim-session'

" Text, easier navigation and editing
Plugin 'ciaranm/detectindent'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'baopham/trailertrash.vim'
Plugin 'tpope/vim-repeat'
Plugin 'xsunsmile/showmarks'

" CVS
Plugin 'tpope/vim-fugitive'
" {{{ Gist
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
" }}}
Plugin 'mhinz/vim-signify'

" Syntax highlighting & templating
Plugin 'mattn/sonictemplate-vim'
Plugin 'sheerun/vim-polyglot'

" Tags & coding related
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/syntastic'
" append, remove semi-colon or comma
Plugin 'lfilho/cosco.vim'
Plugin 'bserem/vim-drupal'
Plugin 'msanders/snipmate.vim'

" Appearance
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Others
Plugin 'gmarik/sudo-gui.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'mbbill/undotree'
Plugin 'szw/vim-maximizer'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Important settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set laststatus=2
set encoding=utf-8
" Set vim for 256 color schemes
set t_Co=256

if has('mouse')
  set mouse=a
  if !has('gui_running')
      set ttymouse=xterm2
  endif
endif

if exists('+autochdir')
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Disable bell
set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""
colo Sunburst

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI MacVim
""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
  colo wombat
  set gfn=Monaco\ for\ Powerline:h12
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set showtabline=2 "always show tabs
  set macmeta

  let g:tagbar_iconchars = ['▸', '▾']

  map <SwipeLeft> gT
  map <SwipeRight> gt
  imap <SwipeLeft> <Esc>gT<CR>
  imap <SwipeRight> <Esc>gt<CR>

  " Turn on/off transparency
  map <Leader>trn :set transparency=8<CR>
  map <Leader>trf :set transparency=0<CR>

  " Show tab number
  autocmd VimEnter * set guitablabel=%M\ %t\ \⌘%N

  " Enable horizontal scrolling
  " set guioptions+=h
  " set nowrap
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set binary

if !has("gui_running")
  set ttimeout
  set ttimeoutlen=100
endif

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest,full

set hlsearch

set ignorecase "ignore case when searching
set smartcase

set magic "set magic on, for regular expressions

set ruler
set number

set undolevels=1000

set splitbelow "split windows at bottom

set scrolloff=8 "start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set listchars=eol:\ ,tab:\|\ ,trail:·,extends:>,precedes:<
set list

" Different background color for characters going past the 80 limit
" Credit: http://stackoverflow.com/a/13731714/949806
highlight ColorColumn ctermbg=234 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

" Display help in vertical split window
command -nargs=* -complete=help Help vertical belowright help <args>

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

highlight MatchParen cterm=bold ctermfg=cyan

" Command to change to directory of the current file
command CDC cd %:p:h

" Swap, backup, undo  {{{
  set nobackup
  set noswapfile
  set nowb
  if exists('+undofile')
    set undofile
    " Try `mkdir -p ~/.cache/vim/undo` if the directory doesn't already exist
    if isdirectory(expand('~/.cache/vim/undo')) && &undodir =~# '^\.\%(,\|$\)'
      set undodir^=~/.cache/vim/undo//
    endif
  endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
  exe 'source' fpath
endfor
