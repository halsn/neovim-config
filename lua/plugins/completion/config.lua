local config = {}
function config.nvim_lsp()
  require("plugins.completion.lsp")
end

function config.lspsaga()
  -- Set icons for sidebar.
  local diagnostic_icons = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " ",
  }
  for type, icon in pairs(diagnostic_icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
  end

  local kind = require("lspsaga.lspkind")
  kind[2][2] = " "
  kind[4][2] = " "
  kind[5][2] = "ﴯ "
  kind[6][2] = " "
  kind[7][2] = "ﰠ "
  kind[8][2] = " "
  kind[9][2] = " "
  kind[10][2] = " "
  kind[11][2] = " "
  kind[12][2] = " "
  kind[13][2] = " "
  kind[15][2] = " "
  kind[16][2] = " "
  kind[23][2] = " "
  kind[26][2] = " "

  local saga = require("lspsaga")
  saga.init_lsp_saga({
    diagnostic_header = { " ", " ", "  ", " " },
  })
end

function config.cmp()
  -- vim.cmd([[packadd cmp-tabnine]])
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
  cmp.setup({
    window = {
      completion = {
        border = border("CmpBorder"),
      },
      documentation = {
        border = border("CmpDocBorder"),
      },
    },
    sorting = {
      comparators = {
        -- require("cmp_tabnine.compare"),
        compare.offset,
        compare.exact,
        compare.score,
        require("cmp-under-comparator").under,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    formatting = {
      format = function(entry, vim_item)
        local lspkind_icons = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        }
        -- load lspkind icons
        -- vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

        vim_item.menu = ({
          -- cmp_tabnine = "[TN]",
          buffer = "[BUF]",
          orgmode = "[ORG]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[LUA]",
          path = "[PATH]",
          tmux = "[TMUX]",
          luasnip = "[SNIP]",
          spell = "[SPELL]",
        })[entry.source.name]

        return vim_item
      end,
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
      -- ["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true })
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-h>"] = cmp.mapping.scroll_docs(-4),
      ["<C-l>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
      -- ["<C-h>"] = function(fallback)
      --   if require("luasnip").jumpable(-1) then
      --     vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
      --   else
      --     fallback()
      --   end
      -- end,
      -- ["<C-l>"] = function(fallback)
      --   if require("luasnip").expand_or_jumpable() then
      --     vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
      --   else
      --     fallback()
      --   end
      -- end,
    }),
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    -- You should specify your *installed* sources.
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "path" },
      { name = "spell" },
      { name = "tmux" },
      { name = "orgmode" },
      { name = "buffer" },
      { name = "latex_symbols" },
      -- { name = "cmp_tabnine" },
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
  require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip.loaders.from_snipmate").lazy_load()
end

-- function config.tabnine()
-- 	local tabnine = require("cmp_tabnine.config")
-- 	tabnine:setup({ max_line = 1000, max_num_results = 20, sort = true })
-- end

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
