local tools = {}
local conf = require("plugins.tools.config")

tools["preservim/nerdtree"] = {
  opt = false,
  config = conf.nerdtree,
}

tools["powerman/vim-plugin-AnsiEsc"] = { opt = false }
tools["airblade/vim-rooter"] = { opt = false, config = conf.rooter }
tools["voldikss/vim-translator"] = { opt = false, config = conf.translator }
tools["tpope/vim-surround"] = {
  opt = true,
  event = "BufEnter",
}
tools["tpope/vim-repeat"] = {
  opt = true,
  event = "BufEnter"
}
tools["tpope/vim-fugitive"] = { opt = false }
tools["junkblocker/git-time-lapse"] = {
  opt = true,
  cmd = { "GitTimeLapse" }
}
tools["APZelos/blamer.nvim"] = {
  opt = true,
  cmd = { "BlamerShow" }
}
tools["nathom/filetype.nvim"] = {
  opt = false,
  config = conf.filetype,
}
tools["nvim-telescope/telescope.nvim"] = {
  opt = false,
  module = "telescope",
  cmd = "Telescope",
  config = conf.telescope,
  requires = {
    { "nvim-lua/plenary.nvim", opt = false },
    { "nvim-lua/popup.nvim", opt = true },
  },
}

tools["nvim-telescope/telescope-fzf-native.nvim"] = {
  opt = false,
  run = "make",
  after = "telescope.nvim",
}
tools["nvim-telescope/telescope-project.nvim"] = {
  opt = false,
  after = "telescope-fzf-native.nvim",
}
tools["nvim-telescope/telescope-frecency.nvim"] = {
  opt = false,
  after = "telescope-project.nvim",
  requires = { { "tami5/sqlite.lua", opt = true } },
}

tools["MattesGroeger/vim-bookmarks"] = {
  opt = false,
  config = conf.bookmarks,
}

return tools
