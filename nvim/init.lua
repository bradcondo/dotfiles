-- Load core nvim options
-- Mostly from: https://github.com/josean-dev/dev-environment-files
require("core.options")

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required in Lazy (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Require lazy and setup plugins in lua/plugins folder
require("lazy").setup("plugins")

-- Configure keymaps
require("core.keymaps")
