local global = require("core.global")

vim.cmd([[
  autocmd BufEnter,TermOpen,WinEnter term://* set nonu
  autocmd BufEnter,TermOpen,WinEnter term://* set signcolumn=no
  " autocmd BufLeave,WinLeave term://* stopinsert
  autocmd BufLeave,WinLeave term://* set nu
  autocmd BufLeave,WinLeave term://* set signcolumn=no
  autocmd BufRead,BufNewFile * set signcolumn=yes
  autocmd FileType tagbar,nerdtree set signcolumn=no
  if has('wsl')
    let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
  endif
]])

local function load_options()
  local global_local = {
    termguicolors = true,
    hidden = true,
    fileformats = "unix,mac,dos",
    encoding = "utf-8",
    fenc = "utf-8",
    fencs = "utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp",
    termencoding = "utf-8",
    clipboard = "unnamedplus", -- 解决系统粘贴板问题
    -- undodir = global.cache_dir .. "undo/",
    -- directory = global.cache_dir .. "swap/",
    -- backupdir = global.cache_dir .. "backup/",
    -- viewdir = global.cache_dir .. "view/",
    -- spellfile = global.cache_dir .. "spell/en.uft-8.add",
    -- shada = "!,'300,<50,@100,s10,h",
    timeout = true,
    ttimeout = true,
    timeoutlen = 1000,
    ttimeoutlen = 0,

    -- redrawtime = 1500,
    -- lazyredraw = true, -- Don't redraw while executing macros (good performance config)
    magic = true, -- For regular expressions turn magic on
    ignorecase = true, -- 搜索时，忽略大小写
    smartcase = true, -- 搜索时，智能大小写
    incsearch = true, -- incremental search
    autoindent = true, -- 自动缩进
    smartindent = true, -- 智能缩进
    modeline = true, -- 底部模式行
    autochdir = true, -- 打开文件时，自动 cd 到文件所在目录
    expandtab = true, -- 缩进设置，2个空格代替Tab
    shiftwidth = 2,
    softtabstop = 2,
    smarttab = true,
    swapfile = false,
    autoread = true,
    backspace = "indent,eol,start", -- 在insert模式下能用删除键进行删除
    background = "light",
    scrolloff = 10, -- 光标移动到倒数第10行开始滚屏
    sidescroll = 1, -- 横向滚屏时为1字符
    number = true, -- 显示行号
    showmatch = true, -- 高亮括号配对
    mouse = "",
    updatetim = 300,
    backup = false,
    writebackup = false
  }

  for name, value in pairs(global_local) do
    vim.o[name] = value
  end
end

load_options()
