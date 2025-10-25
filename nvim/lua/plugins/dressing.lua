return {
  'stevearc/dressing.nvim',
  event = "VeryLazy",
  config = function()
    require('dressing').setup({
      input = {
        win_options = {
          winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder,Search:None',
        },
      },
      select = {
        backend = { 'builtin', 'telescope' },
        builtin = {
          win_options = {
            -- Reuse cmp highlight groups for consistency
            winhighlight = 'Normal:CmpPmenu,FloatBorder:FloatBorder,CursorLine:CmpSel,Search:None',
          },
        },
      },
    })
  end,
}
