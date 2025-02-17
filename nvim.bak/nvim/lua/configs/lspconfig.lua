-- Load default LSP configurations from NvChad
require("nvchad.configs.lspconfig").defaults()

-- Set up LSP servers
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd" } -- Add more LSP servers as needed
local nvlsp = require "nvchad.configs.lspconfig"

-- Configure each LSP server with default settings
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach, -- Default on_attach function
    on_init = nvlsp.on_init, -- Default on_init function
    capabilities = nvlsp.capabilities, -- Default capabilities
  }
end

-- Set up LSP with custom mappings using <leader>c as the prefix
require("lsp-setup").setup {
  -- Disable default mappings
  default_mappings = false,

  -- Define all custom mappings with <leader>c prefix

  mappings = {
    -- Code actions
    ["<leader>cc"] = "lua vim.lsp.buf.code_action()", -- Code action
    ["<leader>cd"] = "lua vim.lsp.buf.declaration()", -- Go to Declaration
    ["<leader>ce"] = "lua vim.diagnostic.open_float()", -- Show Diagnostic Float
    ["<leader>cf"] = "lua vim.lsp.buf.formatting()", -- Format Buffer
    ["<leader>ch"] = "lua vim.lsp.buf.hover()", -- Show Hover Information
    ["<leader>ci"] = "lua vim.lsp.buf.implementation()", -- Go to Implementation
    ["<leader>ck"] = "lua vim.lsp.buf.signature_help()", -- Show Signature Help
    ["<leader>cn"] = "lua vim.lsp.buf.rename()", -- Rename Symbol
    ["<leader>cr"] = "lua vim.lsp.buf.references()", -- Show References
    ["<leader>ct"] = "lua vim.lsp.buf.type_definition()", -- Go to Type Definition
    ["<leader>c["] = "lua vim.diagnostic.goto_prev()", -- Go to Previous Diagnostic
    ["<leader>c]"] = "lua vim.diagnostic.goto_next()", -- Go to Next Diagnostic
    ["<leader>cm"] = 'lua require("telescope.builtin").git_commits()', -- Telescope Git Commits
  },
  -- Global on_attach function
  on_attach = function(client, bufnr)
    -- Format on save
    require("lsp-setup.utils").format_on_save(client)
  end,

  -- Global capabilities
  capabilities = vim.lsp.protocol.make_client_capabilities(),

  -- LSP server configurations
  servers = {
    -- Add server-specific configurations here
    -- Example:
    -- pylsp = {}, -- Python LSP
    -- rust_analyzer = { ... }, -- Rust LSP
  },

  -- Inlay hints configuration
  inlay_hints = {
    enabled = false, -- Disable inlay hints by default
    highlight = "comment", -- Highlight style for inlay hints
  },
}

-- Configuring a single server (example: typescript)
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }- }- }- }- }
