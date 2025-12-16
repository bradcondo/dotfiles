local set = vim.opt -- for conciseness

set.encoding = "UTF-8"
set.fileencoding = "UTF-8"

-- line numbers
set.relativenumber = true -- show relative line numbers
set.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
set.tabstop = 2 -- 2 spaces for tabs (prettier default)
set.shiftwidth = 2 -- 2 spaces for indent width
set.expandtab = true -- expand tab to spaces
set.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
set.wrap = false -- disable line wrapping

-- search settings
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
set.cursorline = true -- highlight the current cursor line

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- Enable mouse mode
vim.o.mouse = "a"

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
set.termguicolors = true
set.background = "dark" -- colorschemes that can be light or dark will be made dark
set.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
set.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
set.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true }) -- remap to avoid yanking

-- split windows
set.splitright = true -- split vertical window to the right
set.splitbelow = true -- split horizontal window to the bottom

set.iskeyword:append("-") -- consider string-string as whole word

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- avante
vim.opt.laststatus = 3
