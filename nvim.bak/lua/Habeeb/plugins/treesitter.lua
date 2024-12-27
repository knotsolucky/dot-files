return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",                   -- For auto-closing and renaming tags
    "nvim-treesitter/playground",               -- Treesitter playground for debugging
    "nvim-treesitter/nvim-treesitter-refactor", -- Refactoring support
  },
  config = function()
    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter is not installed properly", vim.log.levels.ERROR)
      return
    end

    ts_configs.setup({
      highlight = {
        enable = true, -- enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },  -- enable indentation
      autotag = { enable = true }, -- enable autotagging

      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css", "prisma",
        "markdown", "markdown_inline", "svelte", "graphql", "bash", "lua", "vim",
        "dockerfile", "gitignore", "query", "vimdoc", "c", "cpp",
      },

      sync_install = false,          -- Install parsers synchronously (only applied to `ensure_installed`)
      ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      modules = {},                  -- Required field, even if empty

      auto_install = true,

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<bs>",
        },
      },

      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false }, -- Can cause errors if left true
        smart_rename = {
          enable = true,
          keymaps = { smart_rename = "grr" },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },

      -- Prevent lagging on large files
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    })
  end,
}

