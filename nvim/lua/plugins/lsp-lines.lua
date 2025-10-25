return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  enabled = false, -- Avoid duplicating diagnostics with inline virtual_text
  event = "VeryLazy",
  config = function()
    require("lsp_lines").setup()
  end,
}
