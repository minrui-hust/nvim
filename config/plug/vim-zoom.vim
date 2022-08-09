
let g:zoom#statustext = '(ZOOM)'
let g:airline_section_a = airline#section#create(['mode', '%{zoom#statusline()}'])
