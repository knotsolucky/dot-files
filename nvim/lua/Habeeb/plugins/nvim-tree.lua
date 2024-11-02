return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- Toggle file explorer
    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

    -- Switch between nvim-tree and editor
    keymap.set("n", "<leader>es", function()
      local view = require("nvim-tree.view")
      if view.is_visible() then
        -- Check if the current window is nvim-tree, if so, switch to the next window
        if vim.fn.winnr() == view.get_winnr() then
          vim.cmd("wincmd w")      -- Switch to the next window
        else
          vim.cmd("NvimTreeFocus") -- Focus on nvim-tree
        end
      else
        vim.cmd("NvimTreeToggle") -- If nvim-tree is not open, toggle it
      end
    end, { desc = "Switch between file explorer and editor" })
  end
}
