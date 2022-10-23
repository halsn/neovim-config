local config = {}

function config.nerdtree()
  vim.cmd([[
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeMouseMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeAutoDeleteBuffer = 1

    " autocmd BufEnter * lcd %:p:h        
  ]])
end

return config
