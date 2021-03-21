
" Auto group to make terminal always in inster mode, whenever focus on
if has('nvim')
  augroup terminal_setup | au!
    autocmd TermOpen,TermEnter,BufEnter term://* startinsert
    autocmd TermOpen term://*
          \ nnoremap <buffer><LeftRelease> <LeftRelease>i|
          \ nnoremap <buffer><RightRelease> <RightRelease>i|
          \ nnoremap <buffer><MiddleRelease> <MiddleRelease>i|
          \ nnoremap <buffer><CR> a|
          \ setlocal  nonumber| setlocal signcolumn=no
  augroup end
endif

