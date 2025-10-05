-- init.lua
-- Bootstrap lazy.nvim

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load basic options
require("config.options")

-- Setup lazy.nvim with plugins
require("lazy").setup("plugins")

-- Load LSP configuration
require("config.lsp")

-- Load completion configuration
require("config.completion")

vim.cmd("colorscheme catppuccin")
