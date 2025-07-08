vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = { '*.md' },
	desc = "Highlight and spell-check markdown files",
	callback = function()
		vim.bo.filetype = 'markdown'
		vim.opt_local.spell = true
	end
})
