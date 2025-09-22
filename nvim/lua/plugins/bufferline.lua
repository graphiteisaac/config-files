return {
	'akinsho/bufferline.nvim',
	after = "catppuccin",
	config = function()
		require("bufferline").setup {
			highlights = require("catppuccin.groups.integrations.bufferline").get_theme(),
			options = {
				diagnostics = 'nvim_lsp',
				separator_style = 'thin',
				hover = {
					enabled = true,
				}
			}
		}
	end,
	dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
}
