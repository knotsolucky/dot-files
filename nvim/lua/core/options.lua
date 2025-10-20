local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.smartcase = true
opt.termguicolors = true -- Allows for colourshemes to properly show up
opt.background = "dark"
opt.signcolumn = "yes"
vim.g.mapleader = " "


opt.fillchars:append({ eob = " " }) -- Gets rid of those annoying "~" lines in the terminal
opt.clipboard:append("unnamedplus")

-- Suppress deprecation warnings
vim.deprecate = function() end
