
let g:slime_target = 'neovim'
let g:slime_no_mapping = 1
let g:slime_cell_delimiter= '#%%'
let g:slime_python_ipython = 1

xmap <C-S> <Plug>SlimeRegionSend
nmap <C-S> <Plug>SlimeParagraphSend
nmap <leader>c <Plug>SlimeSendCell

