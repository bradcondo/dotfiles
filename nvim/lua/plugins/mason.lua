return {
  {
    "williamboman/mason.nvim", -- Language server manager
    dependencies = {
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
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
      })
    end,
  },
}
