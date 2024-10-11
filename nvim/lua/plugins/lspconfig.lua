return {
  {
    "neovim/nvim-lspconfig", -- Configures the nvim LSP client
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} }, -- Standalone UI for nvim-lsp progress
      "folke/neodev.nvim", -- Adds init.lua/nvim API documentation
      "jose-elias-alvarez/typescript.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "MunifTanjim/eslint.nvim",
      "keith/swift.vim",
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    config = function()
      local keymap = vim.keymap -- for conciseness

      -- enable keybinds only for when lsp server available
      local on_attach = function(client, bufnr)
        vim.notify("LSP attached to buffer: " .. bufnr .. ", with client: " .. client.name)

        -- keybind options
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set keybinds
        keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
        keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "tsserver" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
          keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
        end
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local lspconfig = require("lspconfig")

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      require("typescript").setup({
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
      })

      lspconfig.sourcekit.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   desc = "LSP Actions",
      --   callback = function(args)
      --     vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
      --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
      --     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = false })
      --   end,
      -- })

      -- Disabled because this doesn't appear to be needed
      -- require("eslint").setup({
      --   bin = "eslint_d", -- or `eslint_d`
      --   code_actions = {
      --     enable = true,
      --     apply_on_save = {
      --       enable = true,
      --       types = { "directive", "problem", "suggestion", "layout" },
      --     },
      --     disable_rule_comment = {
      --       enable = true,
      --       location = "separate_line", -- or `same_line`
      --     },
      --   },
      --   diagnostics = {
      --     enable = true,
      --     report_unused_disable_directives = false,
      --     run_on = "save", -- or `type`
      --   },
      -- })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure tailwindcss
      lspconfig["tailwindcss"].setup({})
    end,
  },
}
