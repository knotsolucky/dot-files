return {
  "lvimuser/lsp-inlayhints.nvim",
  event = "LspAttach",
  config = function()
    require("lsp-inlayhints").setup({
      inlay_hints = {
        highlight = "Comment",
        only_current_line = false,
        only_current_line_autocmd = "CursorHold",
        show_parameter_hints = true,
        parameter_hints_prefix = "◀ ",
        other_hints_prefix = "▶ ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        label_separator = ", ",
        label_highlight = "LspInlayHint",
      },
    })
  end,
}

