-- Ensure 'alpha-nvim' is installed via packer.nvim or any plugin manager
return {
  "goolord/alpha-nvim", -- Alpha plugin
  event = "VimEnter",   -- Load on startup

  config = function()
    -- Load the necessary Alpha modules
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set the header (ASCII art)
    dashboard.section.header.val = {
      "                                                                          ",
      "  ██╗  ██╗ █████╗ ██████╗ ███████╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ██║  ██║██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██║   ██║██║████╗ ████║ ",
      "  ███████║███████║██████╔╝█████╗  █████╗  ██████╔╝██║   ██║██║██╔████╔██║ ",
      "  ██╔══██║██╔══██║██╔══██╗██╔══╝  ██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║  ██║██║  ██║██████╔╝███████╗███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                                          ",
    }

    -- Set the buttons (menu)
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC m", "  > Mason LSP Configuration", "<cmd>Mason<CR>"),
      dashboard.button("q", "  > Quit Neovim", "<cmd>qa<CR>"),
    }

    -- Setup the dashboard and alpha
    alpha.setup(dashboard.opts)

    -- Disable code folding in the alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,

  -- Ensure icons are available (web-devicons for buttons)
  requires = {
    "nvim-tree/nvim-web-devicons", -- for file icons
  },
}
