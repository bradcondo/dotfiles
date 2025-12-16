local bind = vim.keymap.set

--
-- Telescope
bind("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
bind("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[_] Find existing buffers" })
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
bind("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]resume" })
bind("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

--
-- Diagnostic keymaps
bind("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
bind("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
bind("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
bind("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save buffer
bind("n", "<C-s>", ":w<CR>")
bind("n", "<C-S-s>", ":wq<CR>")
bind("n", "<C-S-r>", ":bufdo e<CR>")

-- -- Formatting
-- bind(
--   "n",
--   "<C-f>",
--   ':lua vim.lsp.buf.format({ async = true, filter = function(client) return client.name == "null-ls" end })<cr>',
--   { silent = true }
-- )

-- Search
bind("n", "<leader>h", "<Cmd>noh<cr>", { silent = true }) -- Deselect on search

-- Tree
bind("n", "<leader><leader>", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
bind("n", "<leader>ff", ":NvimTreeFocus<CR>", { desc = "[F]ocus [F]ile Explorer" })
-- bind({ "n", "v", "i" }, "<leader>fi", ":NvimTreeFindFile<CR>", { desc = "[F]ind F[i]le in Explorer" })
bind("n", "<leader>fc", ":NvimTreeCollapse<CR>", { desc = "[F]ile [C]ollapse in Explorer" })

-- Barbar
bind("n", "<A-,>", ":BufferPrevious<CR>")
bind("n", "<A-.>", ":BufferNext<CR>")
bind("n", "<A-x>", ":BufferClose<CR>:NvimTreeFocus<CR>")

-- Aerial
bind("n", "<leader>a", function()
  vim.cmd("AerialToggle")
end)

-- Toggle Bool
bind("n", "<leader>t", ":ToggleBool<CR>")

-- Remove unused variables and imports in TypeScript
bind("n", "<leader>ru", function()
  vim.lsp.buf.execute_command({
    command = "_typescript.removeUnused",
    arguments = { vim.api.nvim_buf_get_name(0) },
  })
end, { desc = "[R]emove [U]nused variables and imports in TypeScript" })

-- In your init.lua or a separate file
local function organize_imports()
  -- Check if eslint config exists
  local eslint_configs = {
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
    ".eslintrc",
    "eslint.config.js",
    "eslint.config.mjs",
  }

  local has_eslint = false
  for _, config in ipairs(eslint_configs) do
    if vim.fn.filereadable(config) == 1 then
      has_eslint = true
      break
    end
  end

  -- Also check package.json for eslint config
  if not has_eslint and vim.fn.filereadable("package.json") == 1 then
    local package_json = vim.fn.readfile("package.json")
    local content = table.concat(package_json, "\n")
    if string.match(content, '"eslintConfig"') then
      has_eslint = true
    end
  end

  if has_eslint then
    -- Run ESLint fix
    vim.cmd("silent! !npx eslint --fix %")
    vim.cmd("edit!") -- Reload the file
  else
    -- Fallback to TypeScript organizeImports
    vim.lsp.buf.code_action({
      filter = function(action)
        return action.kind == "source.organizeImports"
      end,
      apply = true,
    })
  end
end

-- Create a command
vim.api.nvim_create_user_command("OrganizeImports", organize_imports, {})

-- Optional: bind to a key
bind("n", "<leader>oi", function()
  organize_imports()
end, { desc = "[O]rganize [i]mports" })
