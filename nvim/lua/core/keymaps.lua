local bind = vim.keymap.set

--
-- Telescope
bind("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
bind("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
bind("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
bind("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
bind("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
bind("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
bind("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
bind("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

--
-- Diagnostic keymaps
bind("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
bind("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
bind("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
bind("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save buffer
bind("n", "<C-s>", ":w<CR>")
bind("i", "C-s", ":w<CR>")

-- Formatting
bind("n", "<C-f>", ":lua vim.lsp.buf.format({ async = true})<cr>", { silent = true })

-- Search
bind("n", "<leader>/", "<Cmd>noh<cr>", { silent = true }) -- Deselect on search
