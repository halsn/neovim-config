local ui = {}
local conf = require("plugins.ui.config")

ui["NLKNguyen/papercolor-theme"] = { opt = false }
ui["Yggdroot/indentLine"] = { opt = true, event = "BufReadPost", config = conf.indentLine }

return ui
