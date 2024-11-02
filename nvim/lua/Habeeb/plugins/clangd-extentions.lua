return {
  "p00f/clangd_extensions.nvim", -- Specify the clangd extensions plugin
  config = function()
    local clangd_ext = require("clangd_extensions")

    clangd_ext.setup({
      server = {
        cmd = {
          "clangd",
          "--background-index",      -- Enable background indexing
          "--clang-tidy",            -- Enable clang-tidy diagnostics
          "--header-insertion=iwyu", -- Include what you use
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm", -- Fallback code style to use
        },
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        init_options = {
          usePlaceholders = true,    -- Use placeholders in completions
          completeUnimported = true, -- Suggest completions for unimported headers
          clangdFileStatus = true,   -- Show file status in LSP
        },
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" }, -- Keybind to switch between header/source files
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
                "Makefile",
                "configure.ac",
                "configure.in",
                "config.h.in",
                "meson.build",
                "meson_options.txt",
                "build.ninja"
              )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname)
              or require("lspconfig.util").find_git_ancestor(fname)
        end,
      },
      extensions = {
        -- Configure the extensions as needed
        inlay_hints = {
          inline = true,
          only_current_line = false,
          show_parameter_hints = true,
          show_variable_name = true,
        },
        ast = {
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
        memory_usage = {
          border = "rounded",
        },
        symbol_info = {
          border = "rounded",
        },
      },
    })
  end
}
