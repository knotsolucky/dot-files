return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "→",
        group = "",
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 10,
        zindex = 1000,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      ignore_missing = true,
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
        ["<C-"] = "C-",
        ["<S-"] = "S-",
        ["<A-"] = "A-",
      },
      triggers = "auto",
      show_help = true,
      show_keys = true,
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

    -- Register key groups for better organization
    wk.register({
      ["<leader>f"] = { name = "Find" },
      ["<leader>e"] = { name = "Explorer" },
      ["<leader>c"] = { name = "Code" },
      ["<leader>r"] = { name = "Rename" },
      ["<leader>s"] = { name = "Search" },
      ["<leader>w"] = { name = "Workspace" },
      ["<leader>x"] = { name = "Diagnostics" },
      ["<leader>t"] = { name = "Terminal" },
      ["<leader>b"] = { name = "Buffers" },
      ["<leader>g"] = { name = "Git" },
      ["<leader>l"] = { name = "LSP" },
      ["<leader>d"] = { name = "Debug" },
      ["<leader>D"] = { name = "Buffer Diagnostics" },
      ["]"] = { name = "Next" },
      ["["] = { name = "Previous" },
      ["g"] = { name = "Goto" },
    })
  end,
}