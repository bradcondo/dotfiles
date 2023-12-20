return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("kanagawa").setup({
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        functionStyle = { italic = false },
        variableStyle = { italic = false },
        statementStyle = { italic = false },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
}
