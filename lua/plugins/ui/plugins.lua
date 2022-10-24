local ui = {}
local conf = require("plugins.ui.config")

ui["NLKNguyen/papercolor-theme"] = { opt = false }
ui["Yggdroot/indentLine"] = { opt = true, event = "BufReadPost", config = conf.indentLine }
ui["vim-airline/vim-airline"] = {
  opt = false,
  config = conf.airline,
}
ui["vim-airline/vim-airline-themes"] = {
  opt = false,
  requires = "vim-airline",
}
ui["j-hui/fidget.nvim"] = {
  opt = true,
  event = "BufReadPost",
  config = conf.fidget,
}

return ui
