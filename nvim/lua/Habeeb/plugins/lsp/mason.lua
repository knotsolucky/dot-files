return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",      -- For language server management
    "jay-babu/mason-null-ls.nvim",            -- For managing formatters and linters
    "jay-babu/mason-nvim-dap.nvim",           -- For managing DAP installations
    "mfussenegger/nvim-dap",                  -- Core DAP support in Neovim
    "jose-elias-alvarez/null-ls.nvim",        -- Required by mason-null-ls for formatters/linters
  },
  config = function()
    -- import mason and its dependencies
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    local mason_nvim_dap = require("mason-nvim-dap")
    local null_ls = require("null-ls")

    -- enable mason with custom UI icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Configure language servers
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
        "clangd",  -- C/C++ language server
      },
    })

    -- Configure linters and formatters with null-ls
    mason_null_ls.setup({
      ensure_installed = {
        "eslint_d",     -- JavaScript/TypeScript linter
        "prettierd",    -- JavaScript/TypeScript/CSS/HTML formatter
        "stylua",       -- Lua formatter
        "black",        -- Python formatter
        "flake8",       -- Python linter
        "clang-format", -- C/C++ formatter
      },
      automatic_installation = true,
    })

    -- Setup null-ls to use the installed tools
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.flake8,
      },
    })

    -- Configure DAP (debugging)
    mason_nvim_dap.setup({
      ensure_installed = {
        "codelldb",     -- C/C++/Rust debugger
        "python",       -- Python debugger
        "chrome",       -- Chrome debugger for JavaScript
      },
      automatic_installation = true,
    })
  end,
}

