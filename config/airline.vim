set laststatus=2
let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#syntastic#enabled = 1
"
let g:airline_powerline_fonts = 1

let g:airline_theme = "solarized"

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" let g:airline_extensions = []
