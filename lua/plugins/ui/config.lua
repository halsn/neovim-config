local config = {}

function config.indentLine()
  vim.cmd([[
    let g:indentLine_setColors = 1
    let g:indentLine_color_term = 39    			" 设置缩进线颜色
    let g:indentLine_color_gui = '#00afff'
    let g:indentLine_char = '¦' 				" 设置缩进线 字符 ¦
    let g:vim_json_syntax_conceal = 0                           " json文件禁止隐藏引号
    let g:vim_json_conceal = 0
    let g:indentLine_fileTypeExclude = ['startify', 'dashboard', 'dotooagenda', 'log', 'fugitive', 'gitcommit', 'packer', 'vista', 'help', 'todoist', 'peekaboo', 'json', 'git', 'TelescopePrompt', 'undotree', 'flutterToolsOutline', 'lspsagafinder', 'lspsagafindertitlebar', '']
    let g:indentLine_bufTypeExclude = ['help', 'terminal']
  ]])
end

function config.fidget()
  require("fidget").setup({})
end

function config.airline()
  vim.cmd([[
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

    let g:airline#extensions#branch#enabled = 1

    " let g:airline_extensions = []
  ]])
end

return config
