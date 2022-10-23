local config = {}

function config.easymotion()
  vim.cmd([[
    hi EasyMotionTarget ctermbg=253 ctermfg=253
    " hi EasyMotionShade  ctermbg=none
    hi EasyMotionTarget2First ctermbg=253 ctermfg=253
    hi EasyMotionTarget2Second ctermbg=253 ctermfg=253
  ]])
end
return config
