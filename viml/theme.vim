" UI设置
syntax on                                               " 打开语法高亮
colorscheme PaperColor
set background=light
" colorscheme monokai                                     " 设置主题monokai
" hi Normal ctermbg=none                                  " 设置主题時不显示背景
" let g:monokai_thick_border = 1
hi NonText ctermbg=none
hi MatchParen cterm=none ctermbg=190 ctermfg=46         " 括号匹配颜色
hi Folded ctermbg=253 ctermfg=51                         " 设置折叠区颜色
" set textwidth=80                                      " 设置每行最长宽度
set t_Co=256                                            " 设置主题时背景是否可变,256色支持
" set cursorline                                        " 显示横线
" set cursorcolumn                                      " 显示列线
set scrolloff=10                                        " 光标移动到倒数第10行开始滚屏
set sidescroll=1                                        " 横向滚屏时为1字符
set number                                              " 显示行号
set showmatch                                           " 高亮括号配对
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                     " 插入模式下光标变为竖线
set hidden
" 高亮光标下单词
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
