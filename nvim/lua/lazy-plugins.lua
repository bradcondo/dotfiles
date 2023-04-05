-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required in Lazy (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --
  -- Color scheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },

  --
  -- Git plugins
  "tpope/vim-fugitive", -- Enables git commands via :Git or :G
  {
    "lewis6991/gitsigns.nvim", -- Adds git releated signs to the gutter, as well as utilities for managing changes
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  --
  -- Completions
  {
    "hrsh7th/nvim-cmp", -- Autocompletion
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Source for nvim completions
      "hrsh7th/cmp-buffer", -- Source for text in current buffers
      "hrsh7th/cmp-path", -- Source for file paths
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Source for LuaSnip
      "rafamadriz/friendly-snippets", -- A lot of useful language snippets
      "onsails/lspkind.nvim", -- Icons for autocompletions
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  --
  -- Text editing
  "tpope/vim-sleuth", -- Detects `shiftwidth` and `expandtab` heuristically
  { "numToStr/Comment.nvim", opts = {} }, -- Adds `gc` to comment regions/lines
  {
    "lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
    opts = {
      char = "┊",
      show_trailing_blankline_indent = false,
    },
  },
  "tpope/vim-surround", -- Allow editing of surrounding text
  {
    "windwp/nvim-autopairs", -- Autoclose non-tags
    config = function()
      require("plugins.autopairs")
    end,
  },
  {
    "windwp/nvim-ts-autotag", -- Autclose of tags
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  --
  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig", -- Configures the nvim LSP client
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} }, -- Standalone UI for nvim-lsp progress
      "folke/neodev.nvim", -- Adds init.lua/nvim API documentation
    },
    config = function()
      require("plugins.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim", -- Language server manager
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- Bridges Mason with LSP client
    },
    config = function()
      require("plugins.mason")
    end,
  },

  --
  -- Syntax/Formatting
  {
    "nvim-treesitter/nvim-treesitter", -- Neovim interface/configuration for Treesitter
    event = "BufReadPre",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },
  "jose-elias-alvarez/null-ls.nvim", -- Allows linters and formatters for LSP
  {
    "jayp0521/mason-null-ls.nvim", -- Bridge between Mason and null-ls
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.null-ls")
    end,
  },

  --
  -- File navigation
  {
    "kyazdani42/nvim-tree.lua", -- Tree File Explorer
    event = { "VimEnter", "BufEnter" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.tree")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim", -- Faster fuzzy finder used by Telescope
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim", -- A faster fuzzy finder
      "nvim-lua/plenary.nvim", -- Shared functions used by many Lua plugins
    },
    config = function()
      require("plugins.telescope")
    end,
  },

  --
  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  --
  -- Status line
  {
    "nvim-lualine/lualine.nvim", -- Adds configurable status line
    opts = {
      options = {
        icons_enabled = false,
        theme = "onedark",
        component_separators = "|",
        section_separators = "",
      },
    },
    config = function()
      require("plugins.lualine")
    end,
  },

  --
  -- Window & Buffer management
  "christoomey/vim-tmux-navigator", -- Allow seamless navigation inside tmux
  "szw/vim-maximizer", -- Allow maximize/restore on buffers

  --
  -- Helper tools to make nvim easier
  { "folke/which-key.nvim", opts = {} }, -- Adds UI to show available commands with keybinds
  {
    "dstein64/vim-startuptime", -- Adds performance profiler to startup
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  "jose-elias-alvarez/typescript.nvim", -- Allow typescript file and import renaming
})
