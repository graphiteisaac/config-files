return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'nvim-lua/plenary.nvim'
	},
	init = function()
		local alpha = require 'alpha'
		local dashboard = require 'alpha.themes.dashboard'

		local welcomes = {
			"Welcome back to Neovim",
			"Snoopy says hello!",
			"You're doing great!",
			"Stand up and stretch!",
			"Drink some water"
		}

		dashboard.section.header.opts = {
			position = 'center',
			hl = 'AlphaHeader',
		}

		dashboard.section.header.val = {
			[[⠀⠀⠀⠀⠀⡀⠀⠀⠀⠨⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠽⠅⠀⠀⠀⠀⠀⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠚⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⠶⠛⠉⠉⠉⠛⠲⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣾⣯⣭⡉⠉⠉⠉⢓⡢⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠠⠾⠯⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠟⠛⠉⠁⠀⠈⠙⠻⣟⡒⠈⠉⠉⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡤⠶⠖⠒⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣆⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣦⠶⢄⠀⠀⠀⠀⠀⠀]],
			[[⠀⠀⠀⠀⠀⣠⡴⠛⠁⠀⠀⠀⠀⠀⠀⠰⣄⠀⠀⠀⠀⠀⠀⠀⠀⡠⢠⣦⣧⣶⣹⣆⠀⠀⠀⠀⠀⢰⣿⣿⠃⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⠳⡄⠀⠀⠀⠀]],
			[[⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠀⠀⠀⠀⠀⠀⣰⢣⣿⡿⣻⣿⣧⣿⠀⠀⠀⠀⣠⣿⡿⠃⠀⠀⠀⣳⡀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠘⡆⠀⠀⠀]],
			[[⠀⠀⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⣿⣿⣷⣿⣿⣿⢸⣧⣀⡤⠊⠁⠀⠀⠀⡴⠛⠿⠍⠙⠲⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⣀⠀⠀]],
			[[⠀⢀⣀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⢸⣿⣿⣿⣿⣿⡿⣼⠏⠁⠀⠀⠀⠀⠀⠸⡿⠦⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠬⠛⡆]],
			[[⢰⣡⣤⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣼⣿⣿⣿⣿⣿⢣⡟⠀⠀⠛⠛⠛⠛⠛⠛⠛⠂⠀⠀⠀⠀⢸⡇⠀⠀⠀⢰⡿⣄⠀⠀⠀⢀⣠⡇]],
			[[⠘⢿⣿⠟⠙⠳⣤⣀⣀⡀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣼⡔⣿⣿⣿⡿⣛⣵⣿⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠾⣄⣀⣀⣠⡼⠁⠈⠳⢤⣤⡤⠾⠁]],
			[[ ⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠻⢮⣭⠵⠞⠉⠉⠉⠉⠙⠛⠛⠉⠛⠋⠉⠛⠛⠛⠛⠋⠉⠁⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
			[[ ]],
		}

		math.randomseed(os.time())
		local subtitle = welcomes[math.random(#welcomes)]

		local header_width = 0
		for _, line in ipairs(dashboard.section.header.val) do
			header_width = math.max(header_width, vim.fn.strdisplaywidth(line))
		end

		local padding = math.floor((header_width - vim.fn.strdisplaywidth(subtitle)) / 2)
		local centered_subtitle = string.rep(' ', padding) .. subtitle

		table.insert(dashboard.section.header.val, centered_subtitle)

		alpha.setup(dashboard.opts)
	end
}
