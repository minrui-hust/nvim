" Set airline theme
let g:airline_theme = 'base16_twilight'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1

function s:current_encoding()
  return &fileencoding
endfunction

let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ':%1.4c'])
