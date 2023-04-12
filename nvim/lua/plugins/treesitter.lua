return {
  {
    "nvim-treesitter/nvim-treesitter", -- Neovim interface/configuration for Treesitter
    event = "BufReadPre",
    build = ":TSUpdate",
    config = function(plugin)
      plugin.setup({
        -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "elixir",
          "heex",
          "html",
          "http",
          "javascript",
          "jq",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "scss",
          "sql",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        -- auto install above language parsers
        auto_install = true,
      })
    end,
  },
}
