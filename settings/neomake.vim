let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']

autocmd! BufWritePost *.js,*.jsx silent NeomakeFile
