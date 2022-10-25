local completion = {}
local conf = require("plugins.completion.config")

completion["williamboman/mason.nvim"] = {
  requires = {
    {
      "williamboman/mason-lspconfig.nvim",
    },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", config = conf.mason_install },
  },
}
completion["neovim/nvim-lspconfig"] = {
  opt = true,
  event = "BufEnter",
  config = conf.nvim_lsp,
}
completion["creativenull/efmls-configs-nvim"] = {
  opt = false,
  requires = "neovim/nvim-lspconfig",
}
completion["glepnir/lspsaga.nvim"] = {
  opt = false,
  after = "nvim-lspconfig",
  config = conf.lspsaga,
}
-- completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }

completion["hrsh7th/nvim-cmp"] = {
  event = "BufEnter",
  requires = {
    { "lukas-reineke/cmp-under-comparator" },
    {
      "quangnguyen30192/cmp-nvim-ultisnips",
      config = function()
        -- optional call to setup (see customization section)
        require("cmp_nvim_ultisnips").setup({})
      end,
      after = "ultisnips",
    },
    { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-ultisnips" },
    { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
    { "hrsh7th/cmp-path", after = "cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer", after = "cmp-path" },
    -- { "uga-rosa/cmp-dictionary", after = "cmp-buffer", config = conf.dictionary },
    {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      after = "cmp-buffer",
      config = conf.tabnine,
    },
  },
  config = conf.cmp,
}
completion["SirVer/ultisnips"] = {
  after = "nvim-cmp",
  config = conf.ultisnipp,
}
completion["windwp/nvim-autopairs"] = {
  after = "nvim-cmp",
  config = conf.autopairs,
}
-- completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion
