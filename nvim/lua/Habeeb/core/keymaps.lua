-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- Bufferline Key Mappings -------------------

-- Open new tab using leader + nt
keymap.set("n", "<leader>nt", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab

-- Navigate to next tab
keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = "Go to next tab" })

-- Navigate to previous tab
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { desc = "Go to previous tab" })

-- Close the current tab
keymap.set('n', '<leader>ct', ':close<CR>', { desc = "Close current tab" })


-- NOTE:
-- This is for my Neovim DAP (Debug Adapter Protocol)

local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreak <CR>",
      "Add breakpoint at line",

    },
  }
}
return M
