local config = {}

function config.easymotion()
  vim.cmd([[
    hi EasyMotionTarget ctermbg=253 ctermfg=253
    " hi EasyMotionShade  ctermbg=none
    hi EasyMotionTarget2First ctermbg=253 ctermfg=253
    hi EasyMotionTarget2Second ctermbg=253 ctermfg=253
  ]])
end

function config.nvim_treesitter()
  -- vim.api.nvim_set_option_value("foldmethod", "expr", {})
  -- vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "lua",
      "go",
      "gomod",
      "json",
      "yaml",
      "latex",
      "make",
      "python",
      "rust",
      "html",
      "javascript",
      "typescript",
      "vue",
      "css",
    },
    highlight = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]["] = "@function.outer",
          ["]m"] = "@class.outer",
        },
        goto_next_end = {
          ["]]"] = "@function.outer",
          ["]M"] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          ["[m"] = "@class.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
          ["[M"] = "@class.outer",
        },
      },
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    matchup = { enable = true },
  })
  require("nvim-treesitter.install").prefer_git = true
  local parsers = require("nvim-treesitter.parsers").get_parser_configs()
  for _, p in pairs(parsers) do
    p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
  end
end

function config.nvim_comment()
  require("nvim_comment").setup({
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })
end

function config.matchup()
  vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

function config.illuminate()
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#FFFF00", fg = "#000000" })
  require("illuminate").configure({
    providers = {
      "regex",
    },
    delay = 50,
    filetypes_denylist = {
      "lspsagafinder",
      "lspsagafindertitlebar",
    },
    under_cursor = true,
  })
end

function config.autotag()
  require("nvim-ts-autotag").setup({
    filetypes = {
      "html",
      "xml",
      "javascript",
      "typescriptreact",
      "javascriptreact",
      "vue",
    },
  })
end

return config
