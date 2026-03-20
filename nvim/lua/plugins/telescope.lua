return {
	'nvim-telescope/telescope.nvim',
	branch = 'master',
	keys = function()
		local function find_files()
			local ok = pcall(require('telescope.builtin').git_files, { show_untracked = true })
			if not ok then
				require('telescope.builtin').find_files()
			end
		end

		return {
			{ '<leader>ff', find_files,                       desc = '(Telescope) Find Files (Git)' },
			{ '<leader>fg', '<cmd>Telescope live_grep<CR>',   desc = '(Telescope) Grep' },
			{ '<leader>fb', '<cmd>Telescope buffers<CR>',     desc = '(Telescope) Open Buffers' },
			{ '<leader>fd', '<cmd>Telescope diagnostics<CR>', desc = '(Telescope) Diagnostics' },
			{ '<leader>fh', '<cmd>Telescope oldfiles<CR>',    desc = '(Telescope) Historic Files' },
		}
	end,
}
