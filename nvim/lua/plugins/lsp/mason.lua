-- return {
--   {
--     "williamboman/mason.nvim",             -- Language server manager
--     dependencies = {
--       "williamboman/mason-lspconfig.nvim", -- Bridges Mason with LSP client
--     },
--     config = function()
--       require("mason").setup()
--
--       require("mason-lspconfig").setup({
--         -- list of servers for mason to install
--         ensure_installed = {
--           "ts_ls",
--           "html",
--           "cssls",
--           "lua_ls",
--           "tailwindcss",
--           "prismals",
--         },
--         -- auto-install configured servers (with lspconfig)
--         automatic_installation = true, -- not the same as ensure_installed
--       })
--
--       -- require("mason-null-ls").setup({
--       --   -- list of formatters & linters for mason to install
--       --   ensure_installed = {
--       --     "prettier", -- ts/js formatter
--       --     "stylua",   -- lua formatter
--       --     "eslint_d", -- ts/js linter
--       --   },
--       --   -- auto-install configured formatters & linters (with null-ls)
--       --   automatic_installation = true,
--       -- })
--     end,
--   },
-- }
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- -- import mason-lspconfig
    -- local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason_lspconfig.setup({
    --   -- list of servers for mason to install
    --   ensure_installed = {
    --     "cssls",
    --     "emmet_ls",
    --     "graphql",
    --     "html",
    --     "lua_ls",
    --     "prismals",
    --     "pyright",
    --     "svelte",
    --     "tailwindcss",
    --     "ts_ls",
    --   },
    -- })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "black", -- python formatter
        "eslint_d",
        -- "isort", -- python formatter
        "prettier", -- prettier formatter
        -- "pylint",
        "stylua", -- lua formatter
      },
    })
  end,
}
