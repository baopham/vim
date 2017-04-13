scriptencoding utf-8

" denite option
let s:denite_options = {
      \ 'default' : {
      \ 'winheight' : 15,
      \ 'mode' : 'insert',
      \ 'quit' : 'true',
      \ 'highlight_matched_char' : 'WarningMsg',
      \ 'highlight_matched_range' : 'WarningMsg',
      \ 'direction': 'rightbelow',
      \ 'prompt' : '➭',
      \ }}

function! s:profile(opts) abort
  for fname in keys(a:opts)
    for dopt in keys(a:opts[fname])
      call denite#custom#option(fname, dopt, a:opts[fname][dopt])
    endfor
  endfor
endfunction

function! s:generate_ignore(ignore, tool) abort
  let ignore = []
  if a:tool ==# 'ag'
    for ig in split(a:ignore,',')
      call add(ignore, '--ignore')
      call add(ignore, ig )
    endfor
  elseif a:tool ==# 'rg'
    for ig in split(a:ignore,',')
      call add(ignore, '-g')
      call add(ignore, '!' . ig)
    endfor
  endif
  return ignore
endf

call s:profile(s:denite_options)

" buffer source
call denite#custom#var(
      \ 'buffer',
      \ 'date_format', '%m-%d-%Y %H:%M:%S')

" denite command
if executable('ag')
  " Change file_rec command.
  call denite#custom#var('file_rec', 'command',
        \ ['ag' , '--nocolor', '--nogroup', '-g', '']
        \ )
endif


" FIND and GREP COMMANDS
if executable('rg')
  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

elseif  executable('pt')
  " Pt command on grep source
  call denite#custom#var('grep', 'command', ['pt'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--nogroup', '--nocolor', '--smart-case'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
elseif executable('ag')
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'default_opts',
        \ [ '--vimgrep', '--smart-case' ])
elseif executable('ack')
  " Ack command
  call denite#custom#var('grep', 'command', ['ack'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--match'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'default_opts',
        \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
        \ '--nopager', '--nocolor', '--nogroup', '--column'])
endif

" enable unite menu compatibility
call denite#custom#var('menu', 'unite_source_menu_compatibility', 1)

" KEY MAPPINGS
let s:insert_mode_mappings = [
      \  ['jk', '<denite:enter_mode:normal>', 'noremap'],
      \ ['<Tab>', '<denite:move_to_next_line>', 'noremap'],
      \ ['<S-tab>', '<denite:move_to_previous_line>', 'noremap'],
      \  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
      \  ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
      \  ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
      \  ['<Up>', '<denite:assign_previous_text>', 'noremap'],
      \  ['<Down>', '<denite:assign_next_text>', 'noremap'],
      \  ['<C-Y>', '<denite:redraw>', 'noremap'],
      \ ]

let s:normal_mode_mappings = [
      \   ["'", '<denite:toggle_select_down>', 'noremap'],
      \   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
      \   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
      \   ['gg', '<denite:move_to_first_line>', 'noremap'],
      \   ['st', '<denite:do_action:tabopen>', 'noremap'],
      \   ['sg', '<denite:do_action:vsplit>', 'noremap'],
      \   ['sv', '<denite:do_action:split>', 'noremap'],
      \   ['q', '<denite:quit>', 'noremap'],
      \   ['r', '<denite:redraw>', 'noremap'],
      \ ]

for s:m in s:insert_mode_mappings
  call denite#custom#map('insert', s:m[0], s:m[1], s:m[2])
endfor
for s:m in s:normal_mode_mappings
  call denite#custom#map('normal', s:m[0], s:m[1], s:m[2])
endfor

unlet s:m s:insert_mode_mappings s:normal_mode_mappings

nnoremap <silent> <leader>fr
          \ :<C-u>Denite -resume<CR>
nnoremap <silent> <leader>f  :<C-u>DeniteProjectDir file_mru file_rec<cr>
nnoremap <silent> <leader>mr  :<C-u>DeniteProjectDir file_mru<cr>
nnoremap <silent> <leader>g  :<C-u>DeniteProjectDir grep<cr>
nnoremap <silent> <leader>j  :<C-u>DeniteProjectDir jump<CR>
nnoremap <silent> <leader>y  :<C-u>Denite register<CR>


" vim:set et sw=2 cc=80:
