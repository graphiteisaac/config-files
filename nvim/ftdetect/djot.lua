vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = { '*.dj', '*.djot' },
	desc = "Highlight and spell-check djot files",
	callback = function()
		vim.bo.filetype = 'djot'
		vim.opt_local.spell = true
	end
})
