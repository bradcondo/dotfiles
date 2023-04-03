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
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      require("nvim-tree").setup({
         -- change folder arrow icons
         renderer = {
            icons = {
               glyphs = {
                  folder = {
                     arrow_closed = "", -- arrow when folder is closed
                     arrow_open = "", -- arrow when folder is open
                  },
               },
            },
         },
         -- disable window_picker for
         -- explorer to work well with
         -- window splits
         actions = {
            open_file = {
               window_picker = {
                  enable = false,
               },
            },
         },
         --    git = {
         --        ignore = false,
         --    },
      })

      local function open_nvim_tree(data)
         -- buffer is a [No Name]
         local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

         -- buffer is a directory
         local directory = vim.fn.isdirectory(data.file) == 1

         if not no_name and not directory then
            return
         end

         -- change to the directory
         if directory then
            vim.cmd.cd(data.file)
         end

         -- open the tree
         require("nvim-tree.api").tree.open()
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
      end,
   },
   { -- Set lualine as statusline
      'nvim-lualine/lualine.nvim',
      -- See `:help lualine.txt`
      config = function()
      -- get lualine nightfly theme
      local lualine_nightfly = require("lualine.themes.nightfly")

      -- new colors for theme
      local new_colors = {
         blue = "#65D1FF",
         green = "#3EFFDC",
         violet = "#FF61EF",
         yellow = "#FFDA7B",
         black = "#000000",
      }

      -- change nightlfy theme colors
      lualine_nightfly.normal.a.bg = new_colors.blue
      lualine_nightfly.insert.a.bg = new_colors.green
      lualine_nightfly.visual.a.bg = new_colors.violet
      lualine_nightfly.command = {
         a = {
            gui = "bold",
            bg = new_colors.yellow,
            fg = new_colors.black, -- black
         },
      }

      -- configure lualine with modified theme
      require("lualine").setup({
         options = {
            theme = lualine_nightfly,
         },
      })
   end
  },
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  {
         "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  "jose-elias-alvarez/typescript.nvim",
  "onsails/lspkind.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "jayp0521/mason-null-ls.nvim",
  "windwp/nvim-autopairs",
  { "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter" } },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  }
}
