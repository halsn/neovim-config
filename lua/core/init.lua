local global = require("core.global")
local vim = vim

-- Create cache dir and subs dir
local createdir = function()
  local data_dir = {
    global.cache_dir .. "backup",
    global.cache_dir .. "session",
    global.cache_dir .. "swap",
    global.cache_dir .. "tags",
    global.cache_dir .. "undo",
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute("mkdir -p " .. global.cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

local leader_map = function()
  vim.g.mapleader = ","
  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

local load_core = function()
  -- 注意加载顺序

  local pack = require("core.pack")
  createdir()
  leader_map()

  pack.ensure_plugins()
  pack.load_compile()

  require("core.options")
  require("core.mapping")
  require("keymap")
  require("core.event")

  vim.cmd([[
    set background=light
    colorscheme PaperColor
    hi NonText ctermbg=none
    hi MatchParen cterm=none ctermbg=226 ctermfg=0 guifg=#000000 guibg=#FFFF00          " 括号匹配颜色
    hi Folded ctermbg=253 ctermfg=245 guifg=#8a8a8a guibg=#dadada                         " 设置折叠区颜色

    " Coc configuration
    hi CocSearch ctermfg=24 guifg=#005f87
    hi CocMenuSel cterm=reverse ctermfg=0 ctermbg=7 gui=reverse guifg=#444444 guibg=#d0d0d0
    " hi Pmenu ctermfg=238 ctermbg=254 guibg=#87afaf
    " hi PmenuSel cterm=reverse ctermfg=0 ctermbg=7 gui=reverse guifg=#444444 guibg=#d0d0d0

    hi LspDiagnosticsDefaultWarning ctermfg=247 guifg=#9e9e9e guibg=#eeeeee
    hi LspDiagnosticsDefaultInformation ctermfg=247 guifg=#9e9e9e guibg=#eeeeee
    hi LspDiagnosticsDefaultHint ctermfg=247 guifg=#9e9e9e guibg=#eeeeee
    hi CocInlayHint ctermfg=247 guifg=#9e9e9e guibg=#eeeeee
    hi CocFadeOut ctermfg=247 guifg=#9e9e9e guibg=#eeeeee
    imap <C-j> <C-n>
    imap <C-k> <C-p>
  ]])
end

load_core()
