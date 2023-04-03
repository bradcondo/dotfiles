return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  "ThePrimeagen/vim-be-good",
  
  "nvim-lua/plenary.nvim", -- useful scripts for other lua plugins
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup()
    end,
  },
  "christoomey/vim-tmux-navigator",
  "szw/vim-maximizer",
  "tpope/vim-surround",
  "inkarkat/vim-ReplaceWithRegister",
  "numToStr/Comment.nvim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim"
}
