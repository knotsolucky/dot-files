return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"windwp/nvim-autopairs", -- Auto-close pairs like (), {}, "", etc.
		"rcarriga/nvim-notify", -- For notifications
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local notify = require("notify")
		local cmp_enabled = true -- Global variable for auto-completion state

		-- Set nvim-notify as the default notification handler
		vim.notify = notify

		require("luasnip.loaders.from_vscode").lazy_load()

		-- Set up nvim-autopairs
		local npairs = require("nvim-autopairs")
		npairs.setup({})

		-- Integrate autopairs with nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Function to toggle auto-completion on/off using nvim-notify
		local function toggle_cmp()
			cmp_enabled = not cmp_enabled
			if cmp_enabled then
				notify("Auto-completion enabled", "info", { title = "nvim-cmp" })
			else
				notify("Auto-completion disabled", "warn", { title = "nvim-cmp" })
			end
		end

		-- Keybinding for toggling auto-completion
		vim.keymap.set("n", "<leader>r<c>", toggle_cmp, { noremap = true, silent = true }) -- Toggle auto-completion with leader + r + c

		-- Set up nvim-cmp with conditional auto-completion
		cmp.setup({
			enabled = function()
				return cmp_enabled -- Auto-completion only enabled if cmp_enabled is true
			end,
			window = {
				completion = cmp.config.window.bordered({
					max_height = 8, -- limit autocompletion window to 8 items
				}),
				documentation = cmp.config.window.bordered(),
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up in docs
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down in docs
				["<C-Space>"] = cmp.mapping.complete(), -- manually trigger autocompletion
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm completion
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- language server protocol
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50, -- limit the width of the completion window
					ellipsis_char = "...", -- add ellipsis for overflowed text
				}),
			},
		})
	end,
}
