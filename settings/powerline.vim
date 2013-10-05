" Powerline's hard dividers don't look so good in iTerm with some transparency
if !has('gui_running')
  let g:powerline_config_overrides = {"common":{ "dividers": { "left": { "hard": ' ' }, "right": { "hard" : ' '}}}}
endif
