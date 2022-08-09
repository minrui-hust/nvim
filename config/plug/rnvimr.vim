" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Draw borders
let g:rnvimr_draw_border = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 1

" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1

" draw both borders
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']

" preset layout
let g:rnvimr_presets = [{'width': 0.850, 'height': 0.900}]

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-o>': 'NvimEdit edit',
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-h>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" This is also mapped in which-key
" nmap <leader>r :RnvimrToggle<CR>

