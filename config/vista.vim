autocmd BufEnter * if winnr("$") == 1 && vista#sidebar#IsVisible() | execute "normal! :q!\<CR>" | endif

" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_echo_cursor = 0
let g:vista_close_on_jump = 1
