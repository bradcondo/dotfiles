vim.g.mapleader = " "  -- This needs to be set before loading lazy so we do it here

require("lazy-setup")
require("keymaps")
require("options")
require("autopairs")
require("lspconfig")
require("lspsaga")
require("mason")
require("null-ls")
require("nvim-cmp")
require("telescope")
require("treesitter")
