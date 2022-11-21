local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
  -- NerdTree
  ["n|<leader>t"] = map_cmd(":NERDTreeToggle<cr>"):with_noremap():with_silent(),
  ["n|<leader><leader>t"] = map_cmd(":NERDTreeFind<cr>"):with_noremap():with_silent(),
  -- vim-translator
  ["n|<leader>'"] = map_cmd(":TranslateW<CR>"):with_noremap():with_silent(),
  ["v|<leader>'"] = map_cmd(":TranslateW<CR>"):with_noremap():with_silent(),
  -- nvim-comment
  ["n|<leader>v"] = map_cmd(":CommentToggle<CR>"):with_noremap():with_silent(),
  ["v|<leader>v"] = map_cmd(":CommentToggle<CR>"):with_noremap():with_silent(),

  -- Plugin Telescope
  ["n|}"] = map_cmd(":Telescope find_files<CR>"):with_noremap():with_silent(),
  ["n|{"] = map_cmd(":Telescope grep_string initial_mode=normal<CR>"):with_noremap():with_silent(),
  ["n||"] = map_cmd(":Telescope live_grep<CR>"):with_noremap():with_silent(),
  ["n|<leader>p"] = map_cmd(":Telescope frecency initial_mode=insert<CR>"):with_noremap():with_silent(),
  ["n|<leader><space>"] = map_cmd(":Telescope buffers sort_lastused=true initial_mode=insert<CR>")
    :with_noremap()
    :with_silent(),

  -- Plugin illuminate
  ["n|;"] = map_cmd(":lua require('illuminate').goto_next_reference(wrap)<CR>"):with_noremap():with_silent(),
  ["n|\\"] = map_cmd(":lua require('illuminate').goto_prev_reference(wrap)<CR>"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
