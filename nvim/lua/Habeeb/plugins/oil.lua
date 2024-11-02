return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require("oil")
    oil.setup()

    -- Map "-" to toggle the floating window of oil.nvim
    vim.keymap.set("n", "-", oil.toggle_float, {})

    -- Map "esc" to close the oil.nvim floating window if it is open
    if oil.open then
      vim.keymap.set("n", "esc", function() oil.close() end, {})
    end
  end,
}
