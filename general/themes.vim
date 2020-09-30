
" Set airline theme
let g:airline_theme = 'gruvbox'
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

" Set gruvbox theme
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_invert_selection = 0

" Set vim theme
colorscheme gruvbox

" Terminal use gui color scheme
if(has('termguicolors'))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif
