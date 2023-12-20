return {
  {
    "williamboman/mason.nvim", -- Language server manager
    dependencies = {
      "jayp0521/mason-null-ls.nvim", -- Bridges Mason with null-ls
      "williamboman/mason-lspconfig.nvim", -- Bridges Mason with LSP client
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "lua_ls",
          "tailwindcss",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      })

      require("mason-null-ls").setup({
        -- list of formatters & linters for mason to install
        ensure_installed = {
          "prettier", -- ts/js formatter
          "stylua", -- lua formatter
          "eslint_d", -- ts/js linter
        },
        -- auto-install configured formatters & linters (with null-ls)
        automatic_installation = true,
      })
    end,
  },
}
