-- ~/.config/nvim/lua/custom/plugins/null-ls.lua
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.clang_format,

    -- Linters
    null_ls.builtins.diagnostics.cpplint,
  },
})

