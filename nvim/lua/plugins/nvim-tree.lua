return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        relativenumber = true,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        signcolumn = "yes",
        float = {
          enable = false,
        },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "󰉒",
            bookmark = "󰆤",
            folder = {
              arrow_closed = "󰉋",
              arrow_open = "󰉌",
              default = "󰉓",
              open = "󰉔",
              empty = "󰉖",
              empty_open = "󰉕",
              symlink = "󰉒",
              symlink_open = "󰉔",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "󰅴",
              renamed = "➜",
              untracked = "★",
              deleted = "󰆴",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
      },
    })

    -- Remove custom transparency - let the colorscheme handle it naturally

    -- Keybinds
    local keymap = vim.keymap
    keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle explorer" })
    keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle explorer on current file" })
    keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse explorer" })
    keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh explorer" })
  end,
}