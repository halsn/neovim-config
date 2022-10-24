local tools = {}
local conf = require("plugins.tools.config")

tools["preservim/nerdtree"] = {
  opt = false,
  config = conf.nerdtree,
}
tools["powerman/vim-plugin-AnsiEsc"] = { opt = false }
tools["airblade/vim-rooter"] = { opt = false, config = conf.rooter }
tools["voldikss/vim-translator"] = { opt = false, config = conf.translator }
tools["tpope/vim-surround"] = { opt = true, event = "BufEnter" }
tools["tpope/vim-repeat"] = { opt = true, event = "BufEnter" }
tools["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
tools["junkblocker/git-time-lapse"] = { opt = true, cmd = { "GitTimeLapse" } }
tools["APZelos/blamer.nvim"] = { opt = true, cmd = { "BlamerShow" } }

return tools
