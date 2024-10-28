return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      git = { enable = true },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  -- {
  --   "mbbill/undotree",
  --   lazy = false,
  -- },
  {
    "tpope/vim-rhubarb",
    lazy = false,
  },
}
