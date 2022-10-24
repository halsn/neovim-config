local editor = {}
local conf = require("plugins.editor.config")

editor["LunarWatcher/auto-pairs"] = { opt = false }
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
}

editor["nvim-treesitter/nvim-treesitter"] = {
  opt = true,
  run = ":TSUpdate",
  event = "BufEnter",
  config = conf.nvim_treesitter,
}

editor["andymass/vim-matchup"] = {
  opt = true,
  after = "nvim-treesitter",
  config = conf.matchup,
}

editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
  opt = true,
  after = "nvim-treesitter",
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

editor["windwp/nvim-ts-autotag"] = {
  opt = true,
  after = "nvim-treesitter",
  config = conf.autotag,
}

-- editor["rmagatti/auto-session"] = {
-- 	opt = true,
-- 	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
-- 	config = conf.auto_session,
-- }
-- editor["mfussenegger/nvim-dap"] = {
-- 	opt = true,
-- 	cmd = {
-- 		"DapSetLogLevel",
-- 		"DapShowLog",
-- 		"DapContinue",
-- 		"DapToggleBreakpoint",
-- 		"DapToggleRepl",
-- 		"DapStepOver",
-- 		"DapStepInto",
-- 		"DapStepOut",
-- 		"DapTerminate",
-- 	},
-- 	module = "dap",
-- 	config = conf.dap,
-- }
-- editor["rcarriga/nvim-dap-ui"] = {
-- 	opt = true,
-- 	after = "nvim-dap", -- Need to call setup after dap has been initialized.
-- 	config = conf.dapui,
-- }

return editor
