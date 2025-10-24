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
        winblend = 30,
        zindex = 1000,
        relative = "editor",
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

    -- Set transparency for which-key
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "WhichKey", { bg = "NONE", fg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyGroup", { bg = "NONE", fg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeySeparator", { bg = "NONE", fg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyDesc", { bg = "NONE", fg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE", fg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE", fg = "NONE" })
      end,
    })

    -- Register clean key groups by function type (ONLY WORKING COMMANDS)
    wk.register({
      -- Files & Find (Telescope)
      ["<leader>f"] = { name = "Files & Find" },
      
      -- Buffers
      ["<leader>b"] = { name = "Buffers" },
      
      -- Explorer (NvimTree)
      ["<leader>e"] = { name = "Explorer" },
      
      -- LSP Actions
      ["<leader>l"] = { name = "LSP" },
      
      -- Code & Diagnostics
      ["<leader>c"] = { name = "Code & Diagnostics" },
      
      -- Git (Telescope)
      ["<leader>g"] = { name = "Git" },
      
      -- Windows
      ["<leader>w"] = { name = "Windows" },
      
      -- Tabs
      ["<leader>T"] = { name = "Tabs" },
      
      -- Trouble (Diagnostics)
      ["<leader>t"] = { name = "Trouble" },
      
      -- Symbols
      ["<leader>s"] = { name = "Symbols" },
      
      -- Execute
      ["<leader>x"] = { name = "Execute" },
      
      -- Notifications
      ["<leader>n"] = { name = "Notifications" },
      
      -- Quick Access
      ["<leader>o"] = { name = "Quick Access" },
    })
  end,
}