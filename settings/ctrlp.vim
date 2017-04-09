let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

nnoremap <leader>. :CtrlPTag<cr>
