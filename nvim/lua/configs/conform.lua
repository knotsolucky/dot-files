
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },  -- C++ formatter
    c = { "clang-format" },    -- C formatter (using the same clang-format)
    js = { "prettier" },       -- JavaScript formatter (using prettier)
    ts = { "prettier" },       -- TypeScript formatter (using prettier)
    python = { "black" },      -- Python formatter (using black)
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,         -- Timeout in milliseconds for the formatter to complete
    lsp_fallback = true,      -- Use LSP formatting if no other formatter is found
  },
}

return options

