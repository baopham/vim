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
Bundle 'scrooloose/nerdtree'
Bundle 'baopham/vim-nerdtree-unfocus'

" Text, easier navigation and editing
Bundle 'ciaranm/detectindent'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'junegunn/vim-easy-align'
Bundle 'tpope/vim-surround'
Bundle 'Raimondi/delimitMate'
Bundle 'baopham/trailertrash.vim'

" CVS
Bundle 'tpope/vim-fugitive'

" Syntax highlighting & templating
Bundle 'tpope/vim-markdown'
Bundle 'othree/html5.vim'
Bundle 'python.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'

" Coding related
Bundle 'tomtom/tcomment_vim'

" Others
Bundle 'vim-scripts/YankRing.vim'
Bundle 'mbbill/undotree'

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
  set gfn=Monaco:h12
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

set statusline=
set statusline+=\ %F\                                   " file+path
set statusline+=\%m%r%w\                                " modified? readonly?
set statusline+=%{fugitive#statusline()}                " git branch
set statusline+=\ %<%=%{''.(&fenc!=''?&fenc:&enc).''}   " encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\             " encoding2
set statusline+=\|\ %{&ff}\                             " fileFormat (dos/unix..)
set statusline+=\|\ %y\                                 " fileType
set statusline+=\|\ row:%3p%%\                          " row (%)
set statusline+=\|\ col:%3c\                            " colnumber
set statusline+=\|\ %P                                  " top/bottom

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

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

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
