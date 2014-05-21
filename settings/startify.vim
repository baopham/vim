let g:startify_custom_header =
      \ map(split(system('fortune -s -e computers humorists fortunes wisdom work education science pets | cowsay -f small'), '\n'), '" ". v:val') + ['','']

let g:startify_list_order = [
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Last recently opened files'],
      \ 'files',
      \ ['   Last recently modified files in the current directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]

let g:startify_bookmarks = [ '~/.vim', '~/.vimrc', '~/.tmux.conf' ]

let g:startify_session_autoload = 1

let g:startify_skiplist = [ '.git' ]

" Close startify when opening file via NERDTree and CtrlP
autocmd FileType startify setlocal buftype=
