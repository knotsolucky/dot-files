-- ~/.config/nvim/lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd", "html", "cssls", "lua-language-server" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end
