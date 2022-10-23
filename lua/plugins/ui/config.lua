local config = {}

function config.indentLine()
  vim.cmd([[
    let g:indentLine_enabled = 1				" 开启indentLine插件
    let g:indentLine_color_term = 39    			" 设置缩进线颜色
    let g:indentLine_char = '¦' 				" 设置缩进线 字符 ¦
    let g:vim_json_syntax_conceal = 0                           " json文件禁止隐藏引号
    let g:indentLine_fileTypeExclude = ['startify', 'dashboard', 'dotooagenda', 'log', 'fugitive', 'gitcommit', 'packer', 'vimwiki', 'markdown', 'json', 'txt', 'vista', 'help', 'todoist', 'peekaboo', 'git', 'TelescopePrompt', 'undotree', 'flutterToolsOutline', '']
    let g:indentLine_bufTypeExclude = ['help', 'terminal']
  ]])
end

return config
