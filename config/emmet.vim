let g:user_emmet_mode='n'  						" 仅normal模式有效
let g:user_emmet_install_global = 0					" 默认不加载
autocmd FileType html,css,ejs,swig,pug,jade,sass,scss,vue :EmmetInstall	" 这些文件类型下加载插件
let g:user_emmet_expandabbr_key = '<Tab>'				" Tab键展开
