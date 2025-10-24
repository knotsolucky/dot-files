return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", separator = true }
        },
      },
    })

    -- BufferLine-specific keybinds
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' })
    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { silent = true, desc = 'Pick buffer' })
    vim.keymap.set('n', '<leader>bc', ':BufferLinePickClose<CR>', { silent = true, desc = 'Pick close buffer' })
    vim.keymap.set('n', '<leader>bx', ':BufferLineCloseOthers<CR>', { silent = true, desc = 'Close other buffers' })
  end,
}
