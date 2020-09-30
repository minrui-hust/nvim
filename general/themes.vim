
" Set vim theme
colorscheme onedark

" Set airline theme
let g:airline_theme = 'base16_classic'
let g:airline_powerline_fonts = 1

" Set tabline theme
let g:xtabline_settings = {}
let g:xtabline_settings.indicators = {
      \ 'modified': '+',
      \ 'pinned': '[📌]',
      \}
let g:xtabline_settings.icons = {
      \'pin': '📌',
      \'star': '*',
      \'book': '📖',
      \'lock': '🔒',
      \'hammer': '🔨',
      \'tick': '✔',
      \'cross': '✖',
      \'warning': '⚠',
      \'menu': '☰',
      \'apple': '🍎',
      \'linux': '🐧',
      \'windows': '⌘',
      \'git': '',
      \'palette': '🎨',
      \'lens': '🔍',
      \'flag': '🏁',
      \}

" Terminal use gui color scheme
if(has('termguicolors'))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif
