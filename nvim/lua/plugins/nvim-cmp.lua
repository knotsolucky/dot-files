return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-emoji",
    "f3fora/cmp-spell",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    require("luasnip.loaders.from_vscode").lazy_load()

    local check_backspace = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    cmp.setup({
      preselect = cmp.PreselectMode.Item,
      completion = {
        completeopt = "menu,menuone,preview,noselect",
        max_item_count = 5,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp", max_item_count = 5 },
        { name = "luasnip", max_item_count = 3 },
        { name = "buffer", max_item_count = 5 },
        { name = "path", max_item_count = 3 },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua", max_item_count = 3 },
        { name = "calc" },
        { name = "emoji" },
        { name = "spell" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", lspkind.symbolic(vim_item.kind, { mode = "symbol_text" }))
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            nvim_lsp_signature_help = "[Signature]",
            nvim_lua = "[Lua]",
            calc = "[Calc]",
            emoji = "[Emoji]",
            spell = "[Spell]",
          })[entry.source.name]
          return vim_item
        end,
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          max_height = 5,
          max_width = 50,
          col_offset = 0,
          side_padding = 0,
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpDoc",
        }),
      },
      experimental = {
        ghost_text = false,
      },
    })

    -- Command line completion
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      formatting = { fields = { "abbr" } },
      completion = { keyword_length = 2 },
      sources = { { name = "buffer" } },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      formatting = { fields = { "abbr" } },
      completion = { keyword_length = 2 },
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline" } }
      ),
    })

    lspkind.init({
      symbol_map = {
        Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "󰆧",
        Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "󰒋",
        Module = "󰏗", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
        Enum = "󰒋", Keyword = "󰌋", Snippet = "󰆐", Color = "󰏘",
        File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "󰒋",
        Constant = "󰏿", Struct = "󰆼", Event = "󰅃", Operator = "󰆕",
        TypeParameter = "󰊄",
      },
    })

    -- Remove custom transparency - let the colorscheme handle it naturally
  end,
}