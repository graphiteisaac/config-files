return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		auto_integrations = true,
	},
	init = function()
		vim.cmd.colorscheme("catppuccin-nvim")
	end,
}
