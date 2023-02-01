local config = {}

function config.nerdtree()
  vim.cmd([[
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeMouseMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeAutoDeleteBuffer = 1
    let g:NERDTreeMinimalMenu=0

    " autocmd BufEnter * lcd %:p:h        
  ]])
end

function config.rooter()
  vim.cmd([[
    let g:rooter_resolve_links = 1
  ]])
end

function config.translator()
  vim.cmd([[
    let g:translator_default_engines = ['bing', 'haici']
  ]])
end

function config.filetype()
  -- In init.lua or filetype.nvim's config file
  require("filetype").setup({
    overrides = {
      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = "sh",
      },
    },
  })
end

function config.telescope()
  vim.cmd([[packadd sqlite.lua]])
  vim.cmd([[packadd telescope-fzf-native.nvim]])
  vim.cmd([[packadd telescope-project.nvim]])
  vim.cmd([[packadd telescope-frecency.nvim]])

  local telescope_actions = require("telescope.actions.set")
  local fixfolds = {
    hidden = true,
    attach_mappings = function(_)
      telescope_actions.select:enhance({
        post = function()
          vim.cmd(":normal! zx")
        end,
      })
      return true
    end,
  }

  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-s>"] = "file_split",
          ["<C-v>"] = "file_vsplit",
          ["<C-t>"] = "file_tab",
        },
        n = {
          ["s"] = "file_split",
          ["v"] = "file_vsplit",
          ["t"] = "file_tab",
        },
      },
      initial_mode = "insert",
      prompt_prefix = "> ",
      selection_caret = " ",
      entry_prefix = " ",
      scroll_strategy = "limit",
      results_title = false,
      -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      layout_strategy = "horizontal",
      path_display = { "smart" },
      file_ignore_patterns = {},
      layout_config = {
        prompt_position = "bottom",
        horizontal = {
          preview_width = 0.5,
        },
      },
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    },
    extensions = {
      fzf = {
        fuzzy = false,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      frecency = {
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
      },
    },
    pickers = {
      buffers = fixfolds,
      find_files = fixfolds,
      git_files = fixfolds,
      grep_string = fixfolds,
      live_grep = fixfolds,
      oldfiles = fixfolds,
    },
  })

  require("telescope").load_extension("fzf")
  require("telescope").load_extension("project")
  require("telescope").load_extension("frecency")
end

function config.bookmarks()
  vim.cmd([[
    let g:bookmark_no_default_key_mappings = 1
    let g:bookmark_auto_close = 1
    let g:bookmark_display_annotation = 1
    function! BookmarkMapKeys()
        nmap mm :BookmarkToggle<CR>
        nmap mi :BookmarkAnnotate<CR>
        nmap mn :BookmarkNext<CR>
        nmap mp :BookmarkPrev<CR>
        nmap ma :BookmarkShowAll<CR>
        nmap mc :BookmarkClear<CR>
        nmap mx :BookmarkClearAll<CR>
        nmap mkk :BookmarkMoveUp
        nmap mjj :BookmarkMoveDown
    endfunction
    function! BookmarkUnmapKeys()
        unmap mm
        unmap mi
        unmap mn
        unmap mp
        unmap ma
        unmap mc
        unmap mx
        unmap mkk
        unmap mjj
    endfunction
    autocmd BufEnter * :call BookmarkMapKeys()
    autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
  ]])
end

return config
