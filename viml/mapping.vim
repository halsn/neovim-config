" 快捷键设置
imap ii <Esc>
imap <C-j> <C-n>
imap <C-k> <C-p>
" 快捷键leader
let mapleader=","
set timeout timeoutlen=1500

" 展开错误列表
" nmap <leader>e <Esc>:llist<CR>
" nmap <leader>w <Esc>:ll<CR>

" buffer list
nmap <leader><Space> <Esc>:CtrlSpace<CR>
" 切换buffer
" nmap <leader>j <Esc>:bpre<CR>
" nmap <leader>k <Esc>:bnext<CR>
" 切换Tab
nmap <leader>l <Esc>:tabnext<CR>
nmap <leader>h <Esc>:tabprevious<CR>
nmap <leader>s <Esc>:w<CR>
nmap <leader>q <Esc>:q<CR>
" 让 j, k 可以在 自动wrap的行中上下移动
vmap j gj
vmap k gk
nmap j gj
nmap k gk
" NERDTreeToggle
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader><leader>t :NERDTreeFind<cr>
" TagBar
nmap <leader>b :Tagbar<cr>
" Vista
nmap <leader><leader>v :Vista!!<cr>
" 快速注释
nmap <leader>v <leader>c<space>
vmap <leader>v <leader>c<space>
" reload
nmap <leader>r :e<cr>
" 用空格键来开关折叠
nmap <Space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
vmap <Space> zf
nmap d<Space> zd
vmap d<Space> zd
" 列出所有匹配单词对行
" nmap <Leader>m <Esc>:vim // % \| :copen<cr>
" nmap <Leader>m <Esc>:vim // % \| :Ag <cr>
nmap <silent> { :exe 'CocList --auto-preview --normal --input='.expand('<cword>').' grep'<CR>
nmap <silent> } :exe 'CocList files'<CR>
nmap <silent> <leader>m :exe 'CocList --auto-preview --normal --input='.expand('<cword>').' words'<CR>

" coc mapping
" nmap <silent> <Leader><space> <Esc>:CocList --normal --auto-preview buffers<cr>
nmap <Leader><space> <Esc>:CocList buffers<cr>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:RN` command for rename
command! -nargs=0 RN   :CocAction('rename')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> <leader>w <Plug>(coc-diagnostic-next)
nmap <silent> <leader>e :<C-u>CocList --normal --auto-preview diagnostics<cr>

" Remap for format selected region
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)
" Fix autofix problem of current line
nmap <leader><leader>qf  <Plug>(coc-fix-current)

" 内置Terminal快捷键
" 自动insert 取消line number
" autocmd BufEnter,TermOpen,WinEnter term://* startinsert
autocmd BufEnter,TermOpen,WinEnter term://* set nonu
" autocmd BufLeave,WinLeave term://* stopinsert
autocmd BufLeave,WinLeave term://* set nu
tnoremap <Esc> <C-\><C-n>
nmap <leader>g <Esc>:tabedit term://$SHELL<CR>
nmap <leader><leader>g <Esc>:tabedit term://cmd.exe<CR>
nmap <leader>f <Esc>:sp term://$SHELL<CR>
nmap <leader>d <Esc>:vsp term://$SHELL<CR>
nmap <leader>i <Esc>:tabnew<CR>

nmap <leader>k <C-b>
nmap <leader>j <C-f>

" tnoremap <F10> <C-\><C-n>:tabnext<CR>
" tnoremap <F9> <C-\><C-n>:tabprevious<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" nmap <F10> :tabnext<CR>
" nmap <F9> :tabprevious<CR>
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l
nmap <A-left> <Esc>:vertical resize -1<CR>
nmap <A-right> <Esc>:vertical resize +1<CR>
nmap <A-up> <Esc>:resize +1<CR><S-n>
nmap <A-down> <Esc>:resize -1<CR>
vmap // y/<C-R>"<CR>
vmap .. y/<C-R>"<CR><S-n><S-n>

" ale快捷键
" nmap <leader><leader>d <Esc>:ALEGoToDefinitionInSplit<CR>
" nmap <leader><leader>r <Esc>:ALEFindReferences<CR>
" vmap <leader><leader>d <Esc>:ALEGoToDefinitionInSplit<CR>
" vmap <leader><leader>r <Esc>:ALEFindReferences<CR>

" vim-translator
nmap <silent> <Leader><Leader>m <Plug>Translate
vmap <silent> <Leader><Leader>m <Plug>TranslateV

" movement
nmap <leader>o <C-o>
