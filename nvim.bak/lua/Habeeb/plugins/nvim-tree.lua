return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/which-key.nvim",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		local wk = require("which-key")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Setup nvim-tree
		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- Define keymaps using which-key's updated syntax
		wk.register({
			e = {
				name = "   Explorer", -- Added folder icon next to Explorer
				e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
				f = { "<cmd>NvimTreeFocus<CR>", "Focus on file explorer" },
				r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
				s = {
					function()
						local view = require("nvim-tree.view")
						if view.is_visible() then
							if vim.fn.winnr() == view.get_winnr() then
								vim.cmd("wincmd w")
							else
								vim.cmd("NvimTreeFocus")
							end
						else
							vim.cmd("NvimTreeToggle")
						end
					end,
					"Switch between file explorer and editor",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
