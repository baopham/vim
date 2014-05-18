let g:startify_custom_header =
      \ map(split(system('fortune -s -e computers humorists fortunes wisdom work education science pets | cowsay -f small'), '\n'), '" ". v:val') + ['','']
