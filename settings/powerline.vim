" Powerline's hard dividers don't look so good in iTerm with some transparency
if !has('gui_running')
  " See: github.com/baopham/powerline-config
  let g:powerline_config_overrides = { "ext": { "vim": { "top_theme": "powerline_term" } } }
endif
