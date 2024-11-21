return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- for language server management
  },
  config = function()
    -- import mason and its dependencies
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason with custom ui icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- configure language servers
    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "clangd", -- c/c++ language server
        "gopls",  -- Go language server
        "rust_analyzer",  -- Rust language server
      },
    })
  end,
}

