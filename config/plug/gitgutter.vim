
" Disable gitgutter default mappings
let g:gitgutter_map_keys = 0

" Sign simbol
let g:gitgutter_sign_added                   = '+'
let g:gitgutter_sign_modified                = '~'
let g:gitgutter_sign_removed                 = '-'
let g:gitgutter_sign_removed_first_line      = '-'
let g:gitgutter_sign_removed_above_and_below = '-'
let g:gitgutter_sign_modified_removed        = '-'

" Color
highlight GitGutterAdd    guifg=#587C0C ctermfg=2 guibg=#3c3836 ctermbg=237
highlight GitGutterChange guifg=#0C7D9D ctermfg=3 guibg=#3c3836 ctermbg=237
highlight GitGutterDelete guifg=#94151B ctermfg=1 guibg=#3c3836 ctermbg=237
