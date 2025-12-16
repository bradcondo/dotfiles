return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim", -- A faster fuzzy finder
      "nvim-lua/plenary.nvim", -- Shared functions used by many Lua plugins
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "%.d%.ts$",
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      require("telescope").load_extension("fzf")
    end,
  },
}
