set tags=./tags,~/.vimtags
let g:easytags_syntax_keyword = 'always'
" Look for project specific tags
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_updatetime_min = 5000
let g:easytags_updatetime_warn = 0
let g:easytags_python_enabled="always"
let g:easytags_languages = {
\   'javascript': {
\     'cmd': 'jsctags',
\     'args': ['-f']
\   },
\   'javascript.jsx': {
\     'cmd': 'jsctags',
\     'args': ['-f']
\   }
\}
