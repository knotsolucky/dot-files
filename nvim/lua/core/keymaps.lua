-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- ============================================================================
-- GENERAL KEYMAPS
-- ============================================================================

-- Insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Quick save and quit
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all without saving" })

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Better paste
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Better line joining
keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- ============================================================================
-- FILES & FIND (TELESCOPE) - ALL WORKING
-- ============================================================================

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string (live grep)" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })

-- ============================================================================
-- BUFFERS - ALL WORKING (NATIVE VIM)
-- ============================================================================

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", { desc = "Close other buffers" })

-- ============================================================================
-- EXPLORER (NVIM-TREE) - ALL WORKING
-- ============================================================================

keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle explorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Find file in explorer" })
keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse explorer" })
keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh explorer" })

-- ============================================================================
-- LSP ACTIONS - ONLY WORKING COMMANDS
-- ============================================================================

-- LSP Actions
keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Smart rename" })
keymap.set("n", "<leader>lR", ":LspRestart<CR>", { desc = "Restart LSP" })
keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LSP info" })
keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format document" })
keymap.set("v", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format selection" })
keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- LSP Symbols & Outline (WORKING)
keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
keymap.set("n", "<leader>lo", "<cmd>lua require('aerial').toggle()<CR>", { desc = "Toggle outline" })

-- LSP Range Code Actions
keymap.set("v", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions (range)" })

-- ============================================================================
-- CODE & DIAGNOSTICS - ALL WORKING
-- ============================================================================

-- Diagnostics
keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostics" })
keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })
keymap.set("n", "<leader>cDD", "<cmd>Telescope diagnostics<CR>", { desc = "All diagnostics" })
keymap.set("n", "<leader>cq", vim.diagnostic.setqflist, { desc = "Diagnostics to quickfix" })
keymap.set("n", "<leader>cl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- ============================================================================
-- GIT (TELESCOPE) - ALL WORKING
-- ============================================================================

keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<CR>", { desc = "Git files" })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })

-- ============================================================================
-- WINDOWS - ALL WORKING (NATIVE VIM)
-- ============================================================================

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ============================================================================
-- TABS - ALL WORKING (NATIVE VIM)
-- ============================================================================

keymap.set("n", "<leader>To", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>Tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>Tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>Tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>Tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ============================================================================
-- TROUBLE (DIAGNOSTICS) - WORKING
-- ============================================================================

keymap.set("n", "<leader>tt", "<cmd>lua require('trouble').toggle()<CR>", { desc = "Toggle trouble" })
keymap.set("n", "<leader>tw", "<cmd>lua require('trouble').toggle('workspace_diagnostics')<CR>", { desc = "Workspace diagnostics" })
keymap.set("n", "<leader>td", "<cmd>lua require('trouble').toggle('document_diagnostics')<CR>", { desc = "Document diagnostics" })
keymap.set("n", "<leader>tl", "<cmd>lua require('trouble').toggle('loclist')<CR>", { desc = "Location list" })
keymap.set("n", "<leader>tq", "<cmd>lua require('trouble').toggle('quickfix')<CR>", { desc = "Quickfix list" })

-- ============================================================================
-- SYMBOLS OUTLINE - WORKING
-- ============================================================================

keymap.set("n", "<leader>so", "<cmd>SymbolsOutline<CR>", { desc = "Symbols outline" })

-- ============================================================================
-- EXECUTE - WORKING
-- ============================================================================

keymap.set("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { desc = "Make executable" })
keymap.set("n", "<leader>xd", "<cmd>!./%<CR>", { desc = "Run current file" })

-- ============================================================================
-- NAVIGATION (NO LEADER PREFIX) - ALL WORKING
-- ============================================================================

-- LSP Navigation (g prefix)
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show definitions" })
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show implementations" })
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show type definitions" })
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show references" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Previous/Next navigation
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous error" })
keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next error" })

-- ============================================================================
-- QUICK ACCESS
-- ============================================================================

-- Quick outline access
keymap.set("n", "<leader>o", "<cmd>lua require('aerial').toggle()<CR>", { desc = "Toggle outline" })

-- =========================================================================
-- AI / COPILOT
-- =========================================================================

vim.keymap.set("n", "<leader>co", function()
  local ok, suggestion = pcall(require, "copilot.suggestion")
  if not ok then
    local lazy_ok, lazy = pcall(require, "lazy")
    if lazy_ok then
      lazy.load({ plugins = { "copilot.lua" } })
      ok, suggestion = pcall(require, "copilot.suggestion")
    end
  end
  if ok and suggestion and suggestion.toggle_auto_trigger then
    suggestion.toggle_auto_trigger()
    vim.notify("Toggled Copilot auto-trigger", vim.log.levels.INFO, { title = "Copilot" })
  else
    vim.notify("Copilot not available", vim.log.levels.WARN, { title = "Copilot" })
  end
end, { desc = "Toggle Copilot inline suggestions" })