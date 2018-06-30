let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! ProjectFiles execute 'Files' FindRootDirectory()
nnoremap <leader>f :ProjectFiles<cr>
