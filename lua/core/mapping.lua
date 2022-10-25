local bind = require("keymap.bind")
local vim = vim
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
  -- Vim map
  ["i|ii"] = map_cmd("<Esc>"):with_noremap():with_silent(),
  ["i|<C-j>"] = map_cmd("<C-n>"):with_noremap():with_silent(),
  ["i|<C-k>"] = map_cmd("<C-p>"):with_noremap():with_silent(),
  ["n|<leader>l"] = map_cmd("<Esc>:tabnext<CR>"):with_noremap():with_silent(),
  ["n|<leader>h"] = map_cmd("<Esc>:tabprevious<CR>"):with_noremap():with_silent(),
  ["n|<leader>i"] = map_cmd("<Esc>:tabnew<CR>"):with_noremap():with_silent(),
  ["n|<leader>s"] = map_cmd("<Esc>:w<CR>"):with_noremap():with_silent(),
  ["n|<leader>q"] = map_cmd("<Esc>:q<CR>"):with_noremap():with_silent(),
  ["v|j"] = map_cmd("gj"):with_noremap():with_silent(),
  ["v|k"] = map_cmd("gk"):with_noremap():with_silent(),
  ["n|j"] = map_cmd("gj"):with_noremap():with_silent(),
  ["n|k"] = map_cmd("gk"):with_noremap():with_silent(),
  ["n|<leader>r"] = map_cmd(":e<CR>"):with_noremap():with_silent(),
  ["n|<leader>k"] = map_cmd("<C-b>"):with_noremap():with_silent(),
  ["n|<leader>j"] = map_cmd("<C-f>"):with_noremap():with_silent(),
  ["n|<leader>o"] = map_cmd("<C-o>"):with_noremap():with_silent(),
  ["v|//"] = map_cmd('y/<C-R>"<CR>'):with_noremap():with_silent(),
  ["v|.."] = map_cmd('y/<C-R>"<CR><S-n><S-n>'):with_noremap():with_silent(),
  ["n|<Space>"] = map_cmd("@=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>"):with_noremap():with_silent(),
  ["v|<Space>"] = map_cmd("zf"):with_noremap():with_silent(),
  ["n|d<Space>"] = map_cmd("zd"):with_noremap():with_silent(),
  ["v|d<Space>"] = map_cmd("zd"):with_noremap():with_silent(),
  ["n|<leader>ma"] = map_cmd(":mark a<CR>"):with_noremap():with_silent(),
  ["n|<leader>mb"] = map_cmd(":mark b<CR>"):with_noremap():with_silent(),
  ["n|<leader>mc"] = map_cmd(":mark c<CR>"):with_noremap():with_silent(),
  ["n|<leader>md"] = map_cmd(":mark d<CR>"):with_noremap():with_silent(),
  ["n|<leader>me"] = map_cmd(":mark e<CR>"):with_noremap():with_silent(),
  ["n|<leader>mf"] = map_cmd(":mark f<CR>"):with_noremap():with_silent(),
  ["n|<leader>mg"] = map_cmd(":mark g<CR>"):with_noremap():with_silent(),
  ["n|<leader>mA"] = map_cmd(":mark A<CR>"):with_noremap():with_silent(),
  ["n|<leader>mB"] = map_cmd(":mark B<CR>"):with_noremap():with_silent(),
  ["n|<leader>mC"] = map_cmd(":mark C<CR>"):with_noremap():with_silent(),
  ["n|<leader>mD"] = map_cmd(":mark D<CR>"):with_noremap():with_silent(),
  ["n|<leader>mE"] = map_cmd(":mark E<CR>"):with_noremap():with_silent(),
  ["n|<leader>mF"] = map_cmd(":mark F<CR>"):with_noremap():with_silent(),
  ["n|<leader>mG"] = map_cmd(":mark G<CR>"):with_noremap():with_silent(),

  -- terminal map
  ["t|<Esc>"] = map_cmd("<C-\\><C-n>"):with_noremap():with_silent(),
  ["n|<leader>g"] = map_cmd("<Esc>:tabedit term://$SHELL<CR>"):with_noremap():with_silent(),
  ["n|<leader>f"] = map_cmd("<Esc>:sp term://$SHELL<CR>"):with_noremap():with_silent(),
  ["n|<leader>d"] = map_cmd("<Esc>:vsp term://$SHELL<CR>"):with_noremap():with_silent(),
  ["t|<A-h>"] = map_cmd("<C-\\><C-n><C-w>h"):with_noremap():with_silent(),
  ["t|<A-j>"] = map_cmd("<C-\\><C-n><C-w>j"):with_noremap():with_silent(),
  ["t|<A-k>"] = map_cmd("<C-\\><C-n><C-w>k"):with_noremap():with_silent(),
  ["t|<A-l>"] = map_cmd("<C-\\><C-n><C-w>l"):with_noremap():with_silent(),
  ["n|<A-h>"] = map_cmd("<C-w>h"):with_noremap():with_silent(),
  ["n|<A-j>"] = map_cmd("<C-w>j"):with_noremap():with_silent(),
  ["n|<A-k>"] = map_cmd("<C-w>k"):with_noremap():with_silent(),
  ["n|<A-l>"] = map_cmd("<C-w>l"):with_noremap():with_silent(),
  ["n|<A-left>"] = map_cmd("<Esc>:vertical resize -1<CR>"):with_noremap():with_silent(),
  ["n|<A-right>"] = map_cmd("<Esc>:vertical resize +1<CR>"):with_noremap():with_silent(),
  ["n|<A-up>"] = map_cmd("<Esc>:resize +1<CR>"):with_noremap():with_silent(),
  ["n|<A-down>"] = map_cmd("<Esc>:resize -1<CR>"):with_noremap():with_silent(),

  -- Visual
  ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
  ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
}

bind.nvim_load_mapping(def_map)
