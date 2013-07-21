"""""""""""""""""""""
" OS:  Mac OS       "
" GUI: MacVim       "
" Terminal: iTerm2  "
"""""""""""""""""""""
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'ciaranm/detectindent'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/gist-vim'
Bundle 'gregsexton/gitv'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'thinca/vim-quickrun'
Bundle 'tpope/vim-repeat'
Bundle 'mattn/sonictemplate-vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'baopham/trailertrash.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mattn/webapi-vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'othree/html5.vim'
Bundle 'python.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'amiorin/ctrlp-z'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'baopham/linepower.vim'
Bundle 'aaronbieber/quicktask'

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

augroup ResCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

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
" => Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words dictionary+=$HOME/.vim/spell/en.utf-8.add
set spellsuggest=10
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => KeyMaps
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Insert newline below cursor: press Enter
" Insert newline before cursor: press Shift+Enter
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Map <ESC> to jk, kj in Insert mode
imap jk <ESC>
imap kj <ESC>

" Copy & Paste to/from system clipboard
vmap ,y "*y
map ,p "*p

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Highlight current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <C-c> :silent set cursorline!<Bar>echo<CR>

" Autoclose braces
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O

" Switch between split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Navigate in insert mode
imap <c-e><c-j> <down>
imap <c-e><c-k> <up>
imap <c-e><c-l> <right>
imap <c-e><c-h> <left>

" Easy resizing split windows {{{
  if bufwinnr(1)
    " Horizontal split windows
    nnoremap <silent> + <C-w>+<C-w>+
    nnoremap <silent> - <C-w>-<C-w>-
    " Vertical split windows
    nnoremap <silent> > <C-w>><C-w>>
    nnoremap <silent> < <C-w><<C-w><
  endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Alias
""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev Tabnew tabnew
cnoreabbrev TAbnew tabnew
cnoreabbrev tAbnew tabnew
cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode

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

set tags=.tags;$HOME

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

highlight MatchParen cterm=bold ctermfg=cyan

" Search for selected text, forwards or backwards {{{
  " Press * to search forwards
  vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
  " Press # to search backwards
  vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
" }}}

" Git config {{{
  " Spell check Git commit message
  autocmd BufRead COMMIT_EDITMSG setlocal spell!
" }}}

" Command to change to directory of the current file
command CDC cd %:p:h

" Swap, backup, undo  {{{
  " Try `mkdir -p ~/.cache/vim/{swap,backup,undo}` if the directories don't
  " already exists
  if isdirectory(expand('~/.cache/vim'))
    if &directory =~# '^\.,'
      set directory^=~/.cache/vim/swap//
    endif
    if &backupdir =~# '^\.,'
      set backupdir^=~/.cache/vim/backup//
    endif
    if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
      set undodir^=~/.cache/vim/undo//
    endif
  endif
  if exists('+undofile')
    set undofile
  endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set shiftwidth=4
set numberwidth=4
set softtabstop=4
"set smartindent
autocmd FileType ruby setlocal expandtab sta sw=2 sts=2
autocmd FileType php setlocal expandtab sta sw=2 sts=2
autocmd FileType vim setlocal expandtab sta sw=2 sts=2
au FileType xml exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"
set backspace=indent,eol,start

" Command to set how many spaces
command! -nargs=1 SetSpace call s:SetSpace(<f-args>)
function! s:SetSpace(space)
  setlocal expandtab sta
  let &sw = a:space
  let &sts = a:space
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convert tabs/spaces {{{ 

  " Return indent (all whitespace at start of a line), converted from
  " tabs to spaces if what = 1, or from spaces to tabs otherwise.
  " When converting to tabs, result has no redundant spaces.
  function! Indenting(indent, what, cols)
    let spccol = repeat(' ', a:cols)
    let result = substitute(a:indent, spccol, '\t', 'g')
    let result = substitute(result, ' \+\ze\t', '', 'g')
    if a:what == 1
      let result = substitute(result, '\t', spccol, 'g')
    endif
    return result
  endfunction

  " Convert whitespace used for indenting (before first non-whitespace).
  " what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
  " cols = string with number of columns per tab, or empty to use 'tabstop'.
  " The cursor position is restored, but the cursor will be in a different
  " column when the number of characters in the indent of the line is changed.
  function! IndentConvert(line1, line2, what, cols)
    let savepos = getpos('.')
    let cols = empty(a:cols) ? &tabstop : a:cols
    execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
    call histdel('search', -1)
    call setpos('.', savepos)
  endfunction
  command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
  command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
  command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

" }}}

" Vim info {{{

  " Tell vim to remember certain things when we exit
  "  '10  :  marks will be remembered for up to 10 previously edited files
  "  "100 :  will save up to 100 lines for each register
  "  :20  :  up to 20 lines of command-line history will be remembered
  "  %    :  saves and restores the buffer list
  "  n... :  where to save the viminfo files
  set viminfo='10,\"100,:20,%,n~/.viminfo
  function! ResCur()
    if line("'\"") <= line("$")
      normal! g`"
      return 1
    endif
  endfunction

" }}}

" Swap split windows {{{

  function! MarkWindowSwap()
    let g:markedWinNum = winnr()
  endfunction

  function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
  endfunction

  nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
  nmap <silent> <leader>sw :call DoWindowSwap()<CR>

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item,
" but just inserts the longest common text of all matches
set completeopt=longest,menuone,preview

let OmniCpp_NamespaceSearch = 2 " search name spaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1

" Insert HTML/XML close tag with Option+Command+.
if has('gui_running')
    autocmd FileType xml,html setlocal macmeta " required for MacVim
endif
autocmd FileType xml,html imap <buffer> <M-D-.> </<C-X><C-O>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let SuperTab decide which completion mode to use and should play well with OmniCompletion:
let g:SuperTabDefaultCompletionType = "context"
" Close preview window when completion is finished or canceled
let g:SuperTabClosePreviewOnPopupClose = 1
" Completion chaining
autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0
let g:tagbar_width = 31

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yankring
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>y :YRShow<CR>
let g:yankring_dot_repeat_yank = 1
let g:yankring_history_file = '.vim/bundle/YankRing.vim/yankring_history'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gist
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1
" gist.vim will copy the gist URL automatically after posting it
" or with option '-c' :Gist -c XXXX
" the content of the gist will be put into clipboard
let g:gist_clip_command = 'pbcopy'
" Detect filetype from filename
let g:gist_detect_filetype = 1
" Open browser after posting
let g:gist_open_browser_after_post = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline's hard dividers don't look so good in iTerm with some transparency
if !has('gui_running')
    let g:powerline_config_overrides = {"common":{ "dividers": { "left": { "hard": ' ' }, "right": { "hard" : ' '}}}}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NerdTree automatically when vim starts up and no files are specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NerdTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeChDirMode=2
" 1 click to open dir node, 2 clicks to open file
let NERDTreeMouseMode=2
" Always show bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeStatusline = "%{getcwd()}"
" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
let g:ruby_path ='$HOME/.rvm/rubies/default/bin'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tComment
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i
" Don't comment blank lines
let g:tcommentBlankLines = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = ','

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TrailerTrash
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide trailer highlighting as default
let g:trailertrash_hide_on_open = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""
" => QuickRun
""""""""""""""""""""""""""""""""""""""""""""""""""""
let b:quickrun_config = { 'outputter/buffer/append': 1 }
silent! nnoremap <unique> <silent> <Leader>rh :QuickRun -outputter/buffer/split ""<cr>
silent! nnoremap <unique> <silent> <Leader>rv :QuickRun -outputter/buffer/split "vertical"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitV
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Gitv_DoNotMapCtrlKey = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Undotree
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffAutoOpen = 0
let g:undotree_SplitWidth = 40

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=.git/*,.hg/*,.svn/*
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 1000

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP-Z
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']
nnoremap sz :CtrlPZ<Cr>
nnoremap sf :CtrlPF<Cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyTags
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:easytags_dynamic_files = 1
let g:easytags_cmd = '/usr/local/bin/ctags -f .tags'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => QuickTask
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quicktask_autosave = 1
