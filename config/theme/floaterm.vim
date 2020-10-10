
function! s:FloatermSetColor()
  " Set floaterm window's background to black
  hi Floaterm guibg=#2C0315

  " Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=#2C0315 guifg=white"
endfunction

" Setting highlight directly will be override by  floaterm itself
" we need to set it via VimEnter autocmd, which set highlight after floaterm
" loaded
autocmd VimEnter * call s:FloatermSetColor()

