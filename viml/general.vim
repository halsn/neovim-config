" 文件类型配置
filetype on                                             " 打开文件类型支持
filetype plugin on                                      " 打开文件类型插件支持
filetype indent on                                      " 打开文件类型缩进支持


" 文件编码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set termencoding=utf-8


" 其他设置
set backspace=indent,eol,start                          " 在insert模式下能用删除键进行删除
set smartcase                                           " 搜索时，智能大小写
set ignorecase                                          " 搜索时，忽略大小写
set nocompatible                                        " 与vi不兼容
set autoindent                                          " 自动缩进
set smartindent                                         " 智能缩进
set modeline                                            " 底部模式行
set comments=sl:/*,mb:\ *,elx:\ */                      " 智能注释
set incsearch                                           " incremental search
set lazyredraw                                          " Don't redraw while executing macros (good performance config)
set magic                                               " For regular expressions turn magic on
set autochdir                                           " 打开文件时，自动 cd 到文件所在目录
set expandtab                                           " 缩进设置，2个空格代替Tab
set shiftwidth=2
set softtabstop=2
set smarttab
set noswapfile
set clipboard=unnamed,unnamedplus                       " 解决系统粘贴板问题
set autoread
" 解决wsl复制问题
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

map <silent> "=p :r !powershell.exe -Command Get-Clipboard<CR>
map! <silent> <C-r>= :r !powershell.exe -Command Get-Clipboard<CR>

" I thought this will be better :)
noremap "+p :exe 'norm a'.system('/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command Get-Clipboard')<CR>
" 文件类型配置
filetype on                                             " 打开文件类型支持
filetype plugin on                                      " 打开文件类型插件支持
filetype indent on                                      " 打开文件类型缩进支持


" 文件编码
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set termencoding=utf-8


" 其他设置
set backspace=indent,eol,start                          " 在insert模式下能用删除键进行删除
set smartcase                                           " 搜索时，智能大小写
set ignorecase                                          " 搜索时，忽略大小写
set nocompatible                                        " 与vi不兼容
set autoindent                                          " 自动缩进
set smartindent                                         " 智能缩进
set modeline                                            " 底部模式行
set comments=sl:/*,mb:\ *,elx:\ */                      " 智能注释
set incsearch                                           " incremental search
set lazyredraw                                          " Don't redraw while executing macros (good performance config)
set magic                                               " For regular expressions turn magic on
set autochdir                                           " 打开文件时，自动 cd 到文件所在目录
set expandtab                                           " 缩进设置，2个空格代替Tab
set shiftwidth=2
set softtabstop=2
set smarttab
set noswapfile
set clipboard=unnamed,unnamedplus                       " 解决系统粘贴板问题
set autoread

autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx
