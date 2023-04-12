return {
  {
    "williamboman/mason.nvim", -- Language server manager
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- Bridges Mason with LSP client
    },
    config = function(mason)
      -- import mason-lspconfig plugin safely
      local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
      if not mason_lspconfig_status then
        return
      end

      -- enable mason
      mason.setup()

      mason_lspconfig.setup({
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
