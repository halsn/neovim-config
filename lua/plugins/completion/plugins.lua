local completion = {}
local conf = require("plugins.completion.config")

completion["neoclide/coc.nvim"] = {
  opt = false,
  branch = "release",
  config = conf.coc
}

completion["windwp/nvim-autopairs"] = {
  opt = false,
  config = conf.autopairs,
}

return completion
