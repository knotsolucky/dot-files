return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup()
    
    -- Toggle virtual lines
    vim.keymap.set("n", "<leader>vl", require("lsp_lines").toggle, { desc = "Toggle LSP lines" })
  end,
}
