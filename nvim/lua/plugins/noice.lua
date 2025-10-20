return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      opts = {
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
    popupmenu = {
      enabled = true,
      backend = "nui",
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    lsp = {
      progress = {
        enabled = true,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30,
      },
      hover = {
        enabled = true,
        opts = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
        opts = {
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext",
    },
  },
}