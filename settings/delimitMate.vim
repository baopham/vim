let delimitMate_expand_cr = 2
imap <C-Tab> <Plug>delimitMateS-Tab
" <S-BS> does not work in console vim, so use this as an alternative while
" keeping <S-BS> available
imap <C-d> <C-R>=delimitMate#JumpAny()<CR><BS>
