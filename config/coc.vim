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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
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
let g:coc_snippet_next = '<S-Tab>'

" Use <C-l> for trigger snippet expand.
imap <S-Tab> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <S-Tab> pumvisible() ? coc#_select_confirm() : "\<C-y>"
