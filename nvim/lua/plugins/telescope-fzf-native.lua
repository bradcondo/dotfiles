return {
  {
    "nvim-telescope/telescope-fzf-native.nvim", -- Faster fuzzy finder used by Telescope
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
}
