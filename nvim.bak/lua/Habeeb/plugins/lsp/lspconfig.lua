return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",                                   -- Auto-completion support
    { "antosha417/nvim-lsp-file-operations", config = true }, -- File operations support for LSP
    { "folke/neodev.nvim",                   opts = {} },     -- Lua dev settings
  },
  config = function()
    -- Import required plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap -- Alias for conciseness

    -- Setup capabilities for auto-completion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Define diagnostic symbols in the gutter
    local diagnostic_signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }
    for type, icon in pairs(diagnostic_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Helper function to set key bindings
    local function set_keybindings(buffer)
      local opts = { buffer = buffer, silent = true }

      -- Define key bindings with descriptions
      local key_mappings = {
        { "n",          "gR",         "<cmd>Telescope lsp_references<CR>",       "Show LSP references" },
        { "n",          "gD",         vim.lsp.buf.declaration,                   "Go to declaration" },
        { "n",          "gd",         "<cmd>Telescope lsp_definitions<CR>",      "Show LSP definitions" },
        { "n",          "gi",         "<cmd>Telescope lsp_implementations<CR>",  "Show LSP implementations" },
        { "n",          "gt",         "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions" },
        { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,                   "See available code actions" },
        { "n",          "<leader>rn", vim.lsp.buf.rename,                        "Smart rename" },
        { "n",          "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>",  "Show buffer diagnostics" },
        { "n",          "<leader>d",  vim.diagnostic.open_float,                 "Show line diagnostics" },
        { "n",          "[d",         vim.diagnostic.goto_prev,                  "Go to previous diagnostic" },
        { "n",          "]d",         vim.diagnostic.goto_next,                  "Go to next diagnostic" },
        { "n",          "K",          vim.lsp.buf.hover,                         "Show documentation for cursor" },
        { "n",          "<leader>rs", ":LspRestart<CR>",                         "Restart LSP" },
      }

      -- Iterate through the key mappings and set them
      for _, mapping in ipairs(key_mappings) do
        keymap.set(
          mapping[1],
          mapping[2],
          mapping[3],
          { buffer = opts.buffer, silent = opts.silent, desc = mapping[4] }
        )
      end
    end

    -- Automatically setup key bindings when LSP attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        set_keybindings(ev.buf)
      end,
    })

    -- Setup LSP handlers for different servers
    mason_lspconfig.setup_handlers({
      -- Default handler for all LSP servers
      function(server_name)
        lspconfig[server_name].setup({ capabilities = capabilities })
      end,

      -- clangd specific configuration
      ["clangd"] = function()
        lspconfig["clangd"].setup({
          capabilities = capabilities,
          filetypes = { "c", "cpp", "h", "hpp" },
          settings = {
            clangd = {
              completion = { enable = true, snippetSupport = true },
              semanticHighlighting = true,
              diagnostics = { enable = true },
              compilationDatabase = { compileCommands = "compile_commands.json" },
              arguments = { "--background-index", "--clang-tidy", "--clangd-args=-std=c++17" },
            },
          },
        })
      end,

      -- svelte specific configuration
      ["svelte"] = function()
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, _)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,

      -- GraphQL specific configuration
      ["graphql"] = function()
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,

      -- Emmet configuration for front-end languages
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
          },
        })
      end,

      -- Lua specific configuration
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,
    })
  end,
}
