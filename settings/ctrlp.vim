let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 1000
nnoremap <leader>b :CtrlPBuffer<Cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
