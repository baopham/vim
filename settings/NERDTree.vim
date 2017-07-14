" Open NerdTree automatically when vim starts up and no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NerdTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeChDirMode = 2

" 1 click to open dir node, 2 clicks to open file
let NERDTreeMouseMode = 2

" Always show bookmarks
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['\~$', '\.pyc$']
let NERDTreeStatusline = "%{getcwd()}"

" Toggle NERDTree
map <C-\> :NERDTreeToggle<CR>
