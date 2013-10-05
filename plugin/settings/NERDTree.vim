" Open NerdTree automatically when vim starts up and no files are specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NerdTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeChDirMode = 2
" 1 click to open dir node, 2 clicks to open file
let NERDTreeMouseMode = 2
" Always show bookmarks
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeStatusline = "%{getcwd()}"
" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>
