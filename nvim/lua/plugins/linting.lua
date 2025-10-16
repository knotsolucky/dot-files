return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- Temporarily disabled eslint_d to avoid parsing errors
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      python = { "pylint" },
      lua = { "luacheck" },
    }

    -- Configure eslint_d to handle errors better
    lint.linters.eslint_d = {
      cmd = "eslint_d",
      stdin = true,
      args = { "--format", "json", "--stdin", "--stdin-filename", vim.fn.expand("%:p") },
      ignore_exitcode = true,
      parser = function(output, bufnr)
        local decoded = vim.json.decode(output)
        if not decoded or type(decoded) ~= "table" then
          return {}
        end
        
        local diagnostics = {}
        for _, result in ipairs(decoded) do
          if result.messages then
            for _, message in ipairs(result.messages) do
              table.insert(diagnostics, {
                lnum = math.max(0, (message.line or 1) - 1),
                col = math.max(0, (message.column or 1) - 1),
                end_lnum = math.max(0, (message.endLine or message.line or 1) - 1),
                end_col = math.max(0, (message.endColumn or message.column or 1) - 1),
                severity = message.severity == 2 and vim.diagnostic.severity.ERROR
                  or message.severity == 1 and vim.diagnostic.severity.WARN
                  or vim.diagnostic.severity.INFO,
                source = "eslint",
                message = message.message or "",
              })
            end
          end
        end
        return diagnostics
      end,
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}