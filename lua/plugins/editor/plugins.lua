local editor = {}
local conf = require("plugins.editor.config")

editor["Lokaltog/vim-easymotion"] = {
  opt = true,
  event = "BufEnter",
  config = conf.easymotion,
}
editor["romainl/vim-cool"] = {
  opt = true,
  event = { "CursorMoved", "InsertEnter" },
}
editor["terrortylor/nvim-comment"] = {
  opt = false,
  config = conf.nvim_comment,
  after = "nvim-treesitter",
}

editor["nvim-treesitter/nvim-treesitter"] = {
  opt = true,
  run = ":TSUpdate",
  event = "BufEnter",
  config = conf.nvim_treesitter,
}

editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
  opt = true,
  config = conf.ts_context_commentstring,
  after = "nvim-comment",
}

editor["RRethy/vim-illuminate"] = {
  opt = true,
  event = "BufEnter",
  config = conf.illuminate,
}

editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
  opt = true,
  after = "nvim-treesitter",
}

editor["andymass/vim-matchup"] = {
  opt = true,
  after = "nvim-treesitter",
  config = conf.matchup,
}

editor["windwp/nvim-ts-autotag"] = {
  opt = true,
  after = "nvim-treesitter",
  config = conf.autotag,
}

return editor
