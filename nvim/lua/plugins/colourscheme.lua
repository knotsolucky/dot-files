return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")

		-- Ensure completion and dressing highlight groups are visible and consistent
		local set_hl = function(group, opts)
			vim.api.nvim_set_hl(0, group, opts)
		end

		-- Base groups for cmp popup and documentation
		set_hl('CmpPmenu', { link = 'Pmenu' })
		set_hl('CmpDoc', { link = 'NormalFloat' })
		set_hl('CmpSel', { link = 'PmenuSel' })

		-- Borders and float
		set_hl('FloatBorder', { link = 'FloatBorder' })
		set_hl('NormalFloat', { link = 'NormalFloat' })

		-- Improve CursorLine visibility inside popups if the theme is too subtle
		-- Fallback: if PmenuSel is same as Pmenu, enforce a stronger contrast
		local pmenu = vim.api.nvim_get_hl(0, { name = 'Pmenu' }) or {}
		local pmenu_sel = vim.api.nvim_get_hl(0, { name = 'PmenuSel' }) or {}
		if pmenu.bg and pmenu_sel.bg and pmenu.bg == pmenu_sel.bg then
			set_hl('PmenuSel', { bg = pmenu.bg, bold = true, underline = true })
			set_hl('CmpSel', { link = 'PmenuSel' })
		end
	end,
}
