return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "                                                     ",
      "   ██████╗ ██╗██╗    ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗",
      "  ██╔════╝ ██║██║    ██║██╔══██╗██║   ██║██║████╗ ████║",
      "  ██║  ███╗██║██║ █╗ ██║███████║██║   ██║██║██╔████╔██║",
      "  ██║   ██║██║██║███╗██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "  ╚██████╔╝██║╚███╔███╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "   ╚═════╝ ╚═╝ ╚══╝╚══╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                                                     ",
      "                 ⚡ Powered by Neovim ⚡              ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("SPC e e", "  File Explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC f f", "  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC f s", "  Find Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC f r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("SPC f k", "  Keymaps", "<cmd>Telescope keymaps<CR>"),
      dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim | NvimTreeToggle<CR>"),
      dashboard.button("u", "  Update Plugins", "<cmd>Lazy sync<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}