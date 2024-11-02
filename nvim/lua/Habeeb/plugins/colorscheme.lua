return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha") -- Apply the Catppuccin theme in Mocha flavor
    end,
  },
}

