vim.cmd("let g:netrw_liststyle =  3")
-- Variables for simplicity 
local opt = vim.opt
local g = vim.g


-- Quaility of Life Tweaks
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menuone,noinsert,noselect'

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true


opt.lazyredraw = true
opt.cursorline = true
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
