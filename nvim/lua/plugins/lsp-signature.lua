return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      handler_opts = {
        border = "rounded"
      },
      hint_enable = true,
      hint_prefix = "💡 ",
      hint_scheme = "String",
      hi_parameter = "LspSignatureActiveParameter",
      max_height = 12,
      max_width = 80,
      floating_window = true,
      floating_window_above_cur_line = true,
      floating_window_off_x = 1,
      floating_window_off_y = 0,
      close_timeout = 4000,
      fix_pos = false,
      hint_inline = function() return false end,
      always_trigger = false,
      auto_close_after = nil,
      extra_trigger_chars = {},
      zindex = 200,
      padding = "",
      cursorhold_update = false,
      toggle_key = nil,
      select_signature_key = nil,
      move_cursor_key = nil,
    })
  end,
}
