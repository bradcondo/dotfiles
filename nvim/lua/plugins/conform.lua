return {
  "stevearc/conform.nvim",
  branch = "nvim-0.9",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        swift = { "swiftformat" },
        -- lua = { "stylua" },
        -- javascript = { "prettierd", "prettier", "eslint_d" },
      },
      format_on_save = function(bufnr)
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      log_level = vim.log.levels.ERROR,
    })
  end,
}
