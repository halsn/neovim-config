local config = {}

function config.nvim_lsp()
  require("plugins.completion.lsp")
end

function config.lspsaga()
  -- Set icons for sidebar.
  local diagnostic_icons = {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
  }

  -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#FFFF00", fg = "#000000" })
  vim.api.nvim_set_hl(0, "LspSagaFinderSelection", { bg = "#FFFF00", fg = "#000000", bold = true })
  vim.api.nvim_set_hl(0, "TargetFileName", { fg = "#747777" })
  vim.api.nvim_set_hl(0, "FinderParam", { fg = "#ffffff", bg = "#CBA6F7", bold = true })
  for type, icon in pairs(diagnostic_icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
  end

  local saga = require("lspsaga")
  saga.init_lsp_saga({
    diagnostic_header = { "", "W", "I", "H" },
    code_action_lightbulb = {
      enable = true,
      enable_in_insert = false,
      cache_code_action = true,
      sign = false,
      update_time = 150,
      sign_priority = 20,
      virtual_text = true,
    },
    max_preview_lines = 30,
    finder_icons = {
      def = "",
      ref = "",
      link = "",
      imp = "",
    },
    finder_action_keys = {
      open = "<CR>",
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = "q",
    },
    code_action_keys = {
      quit = "q",
      exec = "<CR>",
    },
    rename_action_quit = "<Esc>",
    rename_in_select = false,
  })
end

function config.cmp()
  vim.cmd([[packadd cmp-tabnine]])
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local border = function(hl)
    return {
      { "╭", hl },
      { "─", hl },
      { "╮", hl },
      { "│", hl },
      { "╯", hl },
      { "─", hl },
      { "╰", hl },
      { "│", hl },
    }
  end

  local cmp_window = require("cmp.utils.window")

  function cmp_window:has_scrollbar()
    return false
  end

  local compare = require("cmp.config.compare")

  local cmp = require("cmp")
  local press = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
  end

  cmp.setup({
    -- window = {
    --   completion = {
    --     border = border("CmpBorder"),
    --   },
    --   documentation = {
    --     border = border("CmpDocBorder"),
    --   },
    -- },
    -- sorting = {
    --   comparators = {
    --     compare.order,
    --     require("cmp_tabnine.compare"),
    --     compare.offset,
    --     compare.exact,
    --     require("cmp-under-comparator").under,
    --     compare.kind,
    --     compare.sort_text,
    --     compare.length,
    --     compare.score,
    --   },
    -- },
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          ultisnips = "[SNIP]",
          nvim_lsp = "[LSP]",
          buffer = "[BUF]",
          cmp_tabnine = "[TN]",
          orgmode = "[ORG]",
          nvim_lua = "[LUA]",
          path = "[PATH]",
          -- dictionary = "[DICT]",
        })[entry.source.name]

        return vim_item
      end,
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
      ["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.confirm({ select = true })
      --   elseif require("luasnip").expand_or_jumpable() then
      --     vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<C-h>"] = function(fallback)
      --   if require("luasnip").jumpable(-1) then
      --     vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
      --   else
      --     fallback()
      --   end
      -- end,
      -- ["<C-l>"] = function(fallback)
      --   if require("luasnip").jumpable(1) then
      --     vim.fn.feedkeys(t("<Plug>luasnip-jump-next"), "")
      --   else
      --     fallback()
      --   end
      -- end,
      ["<C-l>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpForwards()<CR>")
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function(fallback)
        if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
          press("<ESC>:call UltiSnips#JumpBackwards()<CR>")
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    -- snippet = {
    --   expand = function(args)
    --     require("luasnip").lsp_expand(args.body)
    --   end,
    -- },
    -- You should specify your *installed* sources.
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    sources = {
      { name = "ultisnips", priority = 100 },
      { name = "nvim_lsp", priority = 90 },
      { name = "cmp_tabnine", priority = 80 },
      { name = "buffer", priority = 70 },
      { name = "nvim_lua", priority = 60 },
      -- { name = "luasnip" },
      { name = "path", priority = 50 },
      { name = "orgmode", priority = 40 },
      -- {
      --   name = "dictionary",
      --   keyword_length = 2,
      --   priority = 30,
      -- },
      -- { name = "latex_symbols" },
    },
  })
end

function config.luasnip()
  vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/my-snippets/,"
  require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged,InsertLeave",
  })
  require("luasnip.loaders.from_lua").lazy_load()
  require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my-snippets/vscode-snippets" })
  require("luasnip.loaders.from_snipmate").lazy_load()
end

function config.tabnine()
  local tabnine = require("cmp_tabnine.config")
  tabnine:setup({ max_line = 1000, max_num_results = 20, sort = true })
end

function config.dictionary()
  require("cmp_dictionary").setup({
    dic = {
      ["*"] = { "~/.config/nvim/dicts/en.dict" },
      -- spelllang = {
      --   en = "path/to/english.dic",
      -- },
    },
    -- The following are default values.
    exact = 2,
    first_case_insensitive = true,
    document = false,
    document_command = "wn %s -over",
    async = true,
    max_items = -1,
    capacity = 5,
    debug = false,
  })
end

function config.autopairs()
  require("nvim-autopairs").setup({})

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  local handlers = require("nvim-autopairs.completion.handlers")
  cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({
      filetypes = {
        -- "*" is an alias to all filetypes
        ["*"] = {
          ["("] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method,
            },
            handler = handlers["*"],
          },
        },
        -- Disable for tex
        tex = false,
      },
    })
  )
end

function config.mason_install()
  require("mason-tool-installer").setup({
    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
      -- you can turn off/on auto_update per tool
      "editorconfig-checker",

      "stylua",

      "black",

      "prettier",

      "shellcheck",
      "shfmt",

      "vint",
      "typescript-language-server",
    },

    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated.
    -- Default: false
    auto_update = false,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use `:MasonToolsUpdate` to install
    -- tools and check for updates.
    -- Default: true
    run_on_start = true,
  })
end

return config
