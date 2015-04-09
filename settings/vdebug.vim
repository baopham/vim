command! SetLaravelVDebug call s:SetLaravelVDebug()
function! s:SetLaravelVDebug()
  let g:vdebug_options['ide_key'] = 'laravel'
  let g:vdebug_options['server'] = '127.0.0.1'
  let g:vdebug_options['path_maps'] = {'/home/vagrant/projects': '/Users/bao/Projects/laravel'}
endfunction
