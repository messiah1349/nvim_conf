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

require("messiah1349.set")
require("messiah1349.remap")
require("messiah1349.lazy")
require("messiah1349.lsp")

vim.cmd("colorscheme  catppuccin")
vim.cmd("colorscheme  catppuccin-latte")
vim.cmd("colorscheme  catppuccin-macchiato")
vim.cmd("colorscheme  catppuccin-mocha")
