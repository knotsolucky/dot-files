return {
"williamboman/mason.nvim",
  event = "VeryLazy",
  dependencies = {
     "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
    opts = {
    handlers = {},
    ensure_installed = {
      "codelldb",
    }
  },
}
