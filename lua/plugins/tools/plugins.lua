local tools = {}
local conf = require("plugins.tools.config")

tools["preservim/nerdtree"] = {
  opt = false,
  config = conf.nerdtree,
}

return tools
