"""""""""""""""""""""
" OS:  Mac OS       "
" GUI: MacVim       "
" Terminal: iTerm2  "
"""""""""""""""""""""
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" File finder
Bundle 'kien/ctrlp.vim'
Bundle 'amiorin/ctrlp-z'
Bundle 'scrooloose/nerdtree'
Bundle 'baopham/vim-nerdtree-unfocus'

" Text, easier navigation and editing
Bundle 'ciaranm/detectindent'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/vim-easy-align'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-surround'
Bundle 'baopham/trailertrash.vim'
Bundle 'tpope/vim-repeat'
Bundle 'gavinbeatty/dragvisuals.vim'
Bundle 'xsunsmile/showmarks'

" CVS
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'gregsexton/gitv'
Bundle 'mhinz/vim-signify'

" Syntax highlighting & templating
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'python.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/sonictemplate-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'digitaltoad/vim-jade'

" Tags & coding related
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/syntastic'
Bundle 'lfilho/cosco.vim'

" Appearance
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Others
Bundle 'gmarik/sudo-gui.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'mbbill/undotree'
Bundle 'Shougo/junkfile.vim'
Bundle 'szw/vim-maximizer'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Important settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on

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
  set lines=73 columns=212
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
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set binary

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

set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

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
