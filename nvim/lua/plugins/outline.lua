return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      attach_mode = "window",
      backends = { "lsp", "treesitter", "markdown", "man" },
      layout = {
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,
        win_opts = {},
        preserve_equality = false,
      },
      icons = {},
      ignore = {
        unlisted_buffers = false,
        wintypes = {},
        filetypes = {},
        buftypes = "special",
        floating = {
          border = "none",
          relative = "cursor",
          row = 1,
          col = 0,
        },
        lsp_interference = {
          "rust_analyzer",
        },
      },
      highlight_mode = "split_width",
      highlight_closest = true,
      highlight_hovered_item = true,
      highlight_on_hover = false,
      highlight_on_jump = 300,
      disable_max_lines = false,
      disable_max_size = false,
      link_folds_to_folds = false,
      run_autocmd = true,
      autojump = false,
      close_autojump = true,
      close_behavior = "auto",
      update_while_on_cursor = true,
      show_guides = true,
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },
      float = {
        border = "rounded",
        relative = "cursor",
        row = 1,
        col = 0,
      },
      lsp = {
        diagnostics_trigger_update = true,
        update_when_errors = true,
        update_delay = 300,
      },
      treesitter = {
        update_delay = 300,
      },
      markdown = {
        update_delay = 300,
      },
      man = {
        update_delay = 300,
      },
    })
    
    -- Keybinds for aerial
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", { desc = "Toggle outline" })
    vim.keymap.set("n", "<leader>O", "<cmd>AerialOpen<CR>", { desc = "Open outline" })
    vim.keymap.set("n", "<leader>oc", "<cmd>AerialClose<CR>", { desc = "Close outline" })
    vim.keymap.set("n", "<leader>on", "<cmd>AerialNext<CR>", { desc = "Next symbol" })
    vim.keymap.set("n", "<leader>op", "<cmd>AerialPrev<CR>", { desc = "Previous symbol" })
    vim.keymap.set("n", "<leader>og", "<cmd>AerialGo<CR>", { desc = "Go to symbol" })
  end,
}
