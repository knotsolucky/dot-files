return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      signs = true, -- Show icons in the sign column
      sign_priority = 6,
      keywords = {
        FIX = {
          icon = " ", -- Bug icon
          color = "error",
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "BENCH" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE",      -- Don’t override the foreground
        bg = "BOLD",      -- Bold background
      },
      merge_keywords = true, -- Combine your custom keywords with defaults
      highlight = {
        multiline = false,
        before = "",      -- Don’t highlight text before keyword
        keyword = "wide", -- Highlight the whole keyword
        after = "fg",     -- Highlight text after keyword
        pattern = [[.*<(KEYWORDS)\s*:]], -- Pattern to match
        comments_only = true,
        max_line_len = 400,
        exclude = {},     -- Filetypes to exclude
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF8800" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- Match TODO:, FIXME:, etc.
      },
    })

    -- Optional keymaps for quick access
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    -- Telescope integration
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })
  end,
}

