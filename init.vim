" 插件列表
call plug#begin('~/.config/nvim/plugged')

" 功能相关
Plug 'Raimondi/delimitMate'                                     " 自动加括号，换行等
Plug 'Yggdroot/indentLine'                                      " 缩进线
Plug 'scrooloose/nerdcommenter'                                 " 注释插件
Plug 'mattn/emmet-vim'                                          " Emmet神器
Plug 'ap/vim-css-color'                                         " CSS颜色显示
Plug 'vim-airline/vim-airline'                                  " 状态栏
Plug 'vim-airline/vim-airline-themes'                           " 状态栏主题
Plug 'scrooloose/nerdtree'                                      " 查看项目文件
" Plug 'neomake/neomake'                                          " 代码检错
Plug 'Chiel92/vim-autoformat'                                   " 代码格式化
Plug 'SirVer/ultisnips'                                         " 代码块
Plug 'honza/vim-snippets'                                       " 常用代码块集合
Plug 'vim-ctrlspace/vim-ctrlspace'                              " buffer,tab列表
Plug 'Lokaltog/vim-easymotion'                                  " 快速跳转
Plug 'majutsushi/tagbar'                                        " TagBar
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " 自动补全神器
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'powerman/vim-plugin-AnsiEsc'                              " 显示ansi color"
Plug 'pboettch/vim-highlight-cursor-words'                      " 高亮光标单词
" Plug 'zchee/deoplete-jedi'                                      " python-jedi
Plug 'w0rp/ale'                                                 " 代码检错
" Plug 'liuchengxu/vista.vim'                                     " vista
Plug 'editorconfig/editorconfig-vim'                            " editorconfig
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" 语法支持
Plug 'ekalinin/Dockerfile.vim'                                  " Dockerfile
Plug 'leshill/vim-json'                                         " JSON
Plug 'digitaltoad/vim-pug'                                      " Pug
Plug 'nikvdp/ejs-syntax'                                        " ejs
Plug 'mustache/vim-mustache-handlebars'                         " hbs
Plug 'leafgarland/typescript-vim'                               " typescript

" Plug 'mxw/vim-jsx'
" Plug 'digitaltoad/vim-jade'
" Plug 'posva/vim-vue'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'tpope/vim-haml'

call plug#end()

let s:script_cwd = expand('<sfile>:p:h')

let s:viml_path = split(globpath(s:script_cwd . '/viml', '*.vim'), '\n')
" 插件设置
let s:config_path = split(globpath(s:script_cwd . '/config', '*.vim'), '\n')

for s:cfg in s:viml_path
  if filereadable(s:cfg)
    execute 'source ' . s:cfg
  endif
endfor

for s:cfg in s:config_path
  if filereadable(s:cfg)
    execute 'source ' . s:cfg
  endif
endfor

unlet s:script_cwd
unlet s:viml_path
unlet s:config_path
