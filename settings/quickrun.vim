let g:quickrun_config = { 'outputter/buffer/append': 1, 'javascript.jsx': { 'type': 'javascript' } }
silent! nnoremap <unique> <silent> <Leader>rh :QuickRun -outputter/buffer/split ""<cr>
silent! nnoremap <unique> <silent> <Leader>rv :QuickRun -outputter/buffer/split "vertical"<cr>
