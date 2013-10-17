let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=.git/*,.hg/*,.svn/*
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 1000
nnoremap <leader>b :CtrlPBuffer<Cr>
