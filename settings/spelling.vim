set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words dictionary+=$HOME/.vim/spell/en.utf-8.add
set spellsuggest=10
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
