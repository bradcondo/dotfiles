return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim", -- A faster fuzzy finder
      "nvim-lua/plenary.nvim", -- Shared functions used by many Lua plugins
    },
    config = function(plugin)
      plugin.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      plugin.load_extension("fzf")
    end,
  },
}
