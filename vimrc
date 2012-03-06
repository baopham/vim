"""""""""""""""""
" OS:  Mac OS   "
" GUI: MacVim   "
"""""""""""""""""

syntax on
filetype plugin indent on
set nocompatible
set laststatus=2
set encoding=utf-8
" Set vim for 256 color schemes
set t_Co=256

if has('mouse')
    set mouse=a
endif

if has("gui_running")
    colo wombat
    set gfn=Monaco\ for\ Powerline:h12
    set guioptions-=T
    set showtabline=2 "always show tabs
    set lines=73 columns=212
    let g:tagbar_iconchars = ['▸', '▾']
    map <SwipeLeft> gT
	map <SwipeRight> gt
    imap <SwipeLeft> <Esc>gT<CR>
	imap <SwipeRight> <Esc>gt<CR>
    try
        set transparency=8
    catch
    endtry
    " Keep undo history across sessions
    set undodir=~/.vim/backups
    set undofile
    " Show tab number
    autocmd VimEnter * set guitablabel=%M\ %t\ \⌘%N
endif

if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

"Disable bell
set visualbell

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

augroup ResCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect() 
call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()

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

" Map <ESC> to jk, jj in Insert mode 
imap jk <ESC>
imap jj <ESC>

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent nohls<Bar>echo<CR>

" Highlight current line
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <leader>c :silent set cursorline!<Bar>echo<CR>

" Autoclose braces
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O

" Switch between split windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Resize split windows
if bufwinnr(1)
    " Horizontal split windows
    nnoremap <silent> + <C-w>+<C-w>+
    nnoremap <silent> - <C-w>-<C-w>-
    " Vertical split windows
    nnoremap <silent> > <C-w>><C-w>> 
    nnoremap <silent> < <C-w><<C-w>< 
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Alias 
""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev Tabnew tabnew
cnoreabbrev TAbnew tabnew
cnoreabbrev tAbnew tabnew

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest,full

set hlsearch

set ignorecase "ignore case when searching
set smartcase

set magic "set magic on, for regular expressions

set pastetoggle=<F2>

set ruler
set number

set undolevels=1000

set splitbelow "split windows at bottom
"set splitright "split windows on the right

" Resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

let mapleader = ","

set noswapfile "disable swap

"set clipboard=unnamed

highlight MatchParen cterm=bold ctermfg=cyan

" {{{ In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}}

" {{{ Git 
" Spell check Git commit message
autocmd BufRead COMMIT_EDITMSG setlocal spell!
" Show Git diff in window split when committing in terminal
if !has("gui_running")
    autocmd BufRead COMMIT_EDITMSG cd .. | DiffGitCached 
endif
" }}}

" {{{ Funtion to swap split windows 
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
" => Tab and indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set numberwidth=4
set softtabstop=4
"set smartindent
autocmd FileType python setlocal expandtab sta sw=4 sts=4
autocmd FileType html setlocal shiftwidth=4 tabstop=4
au FileType xml exe ":silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null"
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Script to convert tabs/spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" Change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, 
" but just inserts the longest common text of all matches
set completeopt=longest,menuone,preview
let OmniCpp_NamespaceSearch = 2 " search name spaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1

" Insert HTML/XML close tag with Option+Command+.
autocmd FileType xml,html setlocal macmeta " required for MacVim
autocmd FileType xml,html imap <buffer> <M-D-.> </<C-X><C-O>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab 
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
" Let SuperTab decide which completion mode to use and should play well with OmniCompletion: 
let g:SuperTabDefaultCompletionType = "context"
" Close preview window when completion is finished or canceled
let g:SuperTabClosePreviewOnPopupClose = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR> 
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Yankring
""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F5> :YRShow<CR>
let g:yankring_history_dir = '$HOME/.vim/bundle/yankring/'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ConqueTerm
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute current file in Conque window
let g:ConqueTerm_ExecFileKey = '<F11>'
" Send selected text to Conque
let g:ConqueTerm_SendVisKey = '<F9>'
nmap <F12> :ConqueTermSplit bash -l<CR>
let g:ConqueTerm_InsertOnEnter = 1
" Display warning msg at startup
let g:ConqueTerm_StartMessages = 1
let g:ConqueTerm_TERM = 'xterm'
let g:ConqueTerm_ToggleKey = '<F8>'
" Press <C-w" to leave the Conque buffer
let g:ConqueTerm_CWInsert = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gist
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gist_show_privates = 1
let g:gist_private = 1
" gist.vim will copy the gist URL automatically after posting it
" or with option '-c' :Gist -c XXXX 
" the content of the gist will be put into clipboard
let g:gist_clip_command = 'pbcopy'
" Detect filetype from filename
let g:gist_detect_filetype = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'compatible' 
" Overriding symbols
let g:Powerline_symbols_override = {
    \   'BRANCH': [0x2b60]
    \ , 'RO'    : [0x2b64]
    \ , 'FT'    : [0x2b62, 0x2b63]
    \ , 'LINE'  : [0x2b61]
\}
" Overriding dividers
let g:Powerline_dividers_override = ['', [0x2b81], '', [0x2b83]]

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NerdTree automatically when vim starts up and no files are specified
autocmd vimenter * if !argc() | NERDTree | endif
"Close vim if NerdTree is the only window left
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

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader>'