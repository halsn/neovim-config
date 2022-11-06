highlight! Pmenu ctermbg=254
highlight! PmenuSel ctermfg=0 ctermbg=7

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

set updatetime=300

" set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:ag_working_path_mode="r"

" let g:coc_enable_locationlist=0

" coc-snippets config

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'

" imap <S-Tab> <Plug>(coc-snippets-expand)
imap <C-l> <Plug>(coc-snippets-expand-jump)

highlight CocUnusedHighlight  ctermfg=245
" highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

hi CocSearch ctermfg=24 guifg=#005f87
hi CocMenuSel ctermbg=109 guibg=#13354A
