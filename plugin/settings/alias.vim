cnoreabbrev <expr> W (getcmdtype() is# ':' && getcmdline() is# 'W' && getchar(1) isnot char2nr('!')) ? 'w' : 'W'
cnoreabbrev <expr> Q (getcmdtype() is# ':' && getcmdline() is# 'Q') ? 'q' : 'Q'
cnoreabbrev <expr> Wq (getcmdtype() is# ':' && getcmdline() is# 'Wq') ? 'wq' : 'Wq'
cnoreabbrev Tabnew tabnew
cnoreabbrev TAbnew tabnew
cnoreabbrev tAbnew tabnew
