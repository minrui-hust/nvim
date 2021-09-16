
" Map leader 'Space'
let g:which_key_map_space =  {}

" Single mappings
let g:which_key_map_space['.'] = [':e $MYVIMRC', 'open init']
let g:which_key_map_space['r'] = [':RnvimrToggle', 'ranger']
let g:which_key_map_space['e'] = [':NERDTreeToggle', 'explorer']
let g:which_key_map_space['q'] = [':q', 'quit']
let g:which_key_map_space['x'] = [':qa', 'quit all']
let g:which_key_map_space['o'] = [':only', 'only']
let g:which_key_map_space['w'] = [':w', 'write']
let g:which_key_map_space['/'] = [':let @/=""', 'clear highlight']
let g:which_key_map_space['='] = [':FormatAndSave', 'format and save']
let g:which_key_map_space['v'] = [':vs', 'v-split']
let g:which_key_map_space['s'] = [':sp', 'h-split']
let g:which_key_map_space[';'] = [':TagbarToggle', 'toggle tagbar']
let g:which_key_map_space[' '] = [':only|Startify', 'Startify']

" l is for language server protocol
let g:which_key_map_space.l = {
      \ 'name' : '+lsp' ,
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ '=' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'f' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ }

" c is for coc
let g:which_key_map_space.c = {
      \ 'name' : '+coc' ,
      \ ',' : [':CocLocalConfig'                     , 'coc local config'],
      \ '.' : [':CocConfig'                          , 'coc global config'],
      \ 'R' : [':CocRestart'                         , 'restart coc'],
      \ 'c' : [':CocList commands'                   , 'list commands'],
      \ 'm' : [':CocList marketplace'                , 'marketplace'],
      \ 'd' : [':CocList diagnostics'                , 'list diagnostics'],
      \ 'o' : [':CocList outline'                    , 'list outline'],
      \ }

" Register which key map 'space'
call which_key#register('<Space>', "g:which_key_map_space")
nnoremap <silent> <Space> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <Space> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>


