local config = {}

function config.autopairs()
  local remap = vim.api.nvim_set_keymap
  local npairs = require('nvim-autopairs')
  npairs.setup({map_cr=false})

  -- skip it, if you use another global object
  _G.MUtils= {}

  MUtils.completion_confirm=function()
      if vim.fn["coc#pum#visible"]() ~= 0  then
          return vim.fn["coc#pum#confirm"]()
      else
          return npairs.autopairs_cr()
      end
  end

  remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

end

function config.coc()
  local keyset = vim.keymap.set

  vim.opt.shortmess:append('c') -- don't give |ins-completion-menu| messages.
  vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
  vim.api.nvim_create_user_command("OR", "call CocAction('runCommand', 'editor.action.organizeImport')", {})
  vim.api.nvim_create_user_command("Prettier", ":CocCommand prettier.forceFormatDocument", {})

  vim.g.coc_global_extensions = {
    "coc-word",
    "coc-ultisnips",
    "coc-tsserver",
    "coc-snippets",
    "coc-pyright",
    "coc-lists",
    "coc-json",
    "coc-html",
    "coc-eslint",
    "coc-emmet",
    "coc-dictionary",
    "coc-diagnostic",
    "coc-css",
    "coc-tabnine",
    "coc-prettier",
  }

  function _G.check_back_space()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
  end

  function _G.show_docs()
      local cw = vim.fn.expand('<cword>')
      if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
      elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
      else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
      end
  end

  -- auto complete
  local opts = {silent = true, noremap = true, expr = true}

  vim.api.nvim_set_keymap("i", "<TAB>",
                          [[coc#pum#visible() ? coc#pum#next(1) : pumvisible() ? "\<C-n>" : "\<TAB>"]], opts)
  vim.api.nvim_set_keymap("i", "<S-TAB>",
                          [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

  keyset("i", "<c-l>", "<Plug>(coc-snippets-expand-jump)")
  vim.g.coc_snippet_prev = '<c-h>'
  vim.g.coc_snippet_next = '<c-l>'
  vim.g.ag_working_path_mode = 'r'

  -- scroll through documentation
  ---@diagnostic disable-next-line: redefined-local
  local opts = {silent = true, nowait = true, expr = true}
  keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
  keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
  keyset("i", "<C-d>",
         'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
  keyset("i", "<C-f>",
         'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)

  -- go to definition and other things
  keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
  keyset("n", "gn", "<Plug>(coc-rename)", {silent = true})
  keyset("n", "g[", "<Plug>(coc-diagnostic-prev)", {silent = true})
  keyset("n", "g]", "<Plug>(coc-diagnostic-next)", {silent = true})
  keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
  keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
  keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
  keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

  -- code actions and coc stuff
  ---@diagnostic disable-next-line: redefined-local
  local opts = {silent = true, nowait = true}
  keyset("n", "T", "<Plug>(coc-codeaction-cursor)", opts)

  keyset("n", "gf", "<Plug>(coc-fix-current)", opts)
  keyset("n", "<leader>e", ":<C-u>CocList --normal --auto-preview diagnostics<cr>", opts)
  keyset("n", "<leader>m", ":exe 'CocList -I --auto-preview --normal --input='.expand('<cword>').' words'<CR>", opts)
end

return config
