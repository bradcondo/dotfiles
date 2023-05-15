return {
  {
    "romgrk/barbar.nvim",
    enabled = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      insert_at_start = true,
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
  },
}
