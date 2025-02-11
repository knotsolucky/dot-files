require("nvchad.options")

-- General Settings
local o = vim.o

-- Enable Line Numbers
o.number = true -- Absolute line numbers
o.relativenumber = true -- Relative line numbers

-- Highlight Search
o.hlsearch = true -- Highlight search results
o.incsearch = true -- Incremental search (shows matches as you type)
o.ignorecase = true -- Case insensitive search
o.smartcase = true -- Case sensitive if search contains uppercase
o.showmatch = true -- Highlight matching parentheses/brackets

-- Cursorline and Visual Enhancements
o.cursorline = true -- Highlight the current line
o.cursorcolumn = true -- Highlight the current column
o.cursorlineopt = "both" -- Enable cursorline for both current and visual mode

-- Line Wrapping
o.wrap = true -- Enable line wrapping
o.linebreak = true -- Wrap lines at word boundaries
o.textwidth = 80 -- Soft wrap at 80 characters

-- Tab and Indentation Settings
o.tabstop = 2 -- Number of spaces a tab counts for
o.shiftwidth = 2 -- Number of spaces to use for indentation
o.expandtab = true -- Convert tabs to spaces
o.smartindent = true -- Automatically indent when necessary
o.autoindent = true -- Enable automatic indentation
o.smarttab = true -- Smart tabbing (tab character or spaces based on context)

-- Enable Clipboard Support
o.clipboard = "unnamedplus" -- Use system clipboard for copy/paste

-- Auto-Reload Files
o.autoread = true -- Automatically read a file when it's changed externally
o.autowrite = true -- Automatically write a file when switching buffers

-- Smooth Scrolling
o.scrolloff = 8 -- Keep 8 lines above/below the cursor
o.sidescrolloff = 8 -- Keep 8 columns to the left/right of the cursor

-- Show Line and Column Numbers
o.ruler = true -- Show line and column numbers in the status line
o.laststatus = 2 -- Always show the status line

-- Undo Settings
o.undofile = true -- Enable persistent undo
o.undodir = vim.fn.stdpath("config") .. "/undo" -- Specify undo directory
o.undolevels = 1000 -- Number of undo levels to store

-- Backup and Swap Files
o.backup = false -- Disable backup files
o.swapfile = false -- Disable swap files
o.writebackup = false -- Disable write-backup

-- File Type Specific Settings (Example for Python)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.expandtab = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end,
})

-- Enhanced Command Line
o.wildmenu = true -- Enhanced command-line completion
o.wildmode = "list:longest" -- Show longer completion options in the command line
o.history = 1000 -- Increase the history length for command-line input

-- Mouse Support
o.mouse = "a" -- Enable mouse support for all modes

-- Enable Filetype Detection
o.filetype = "on"
