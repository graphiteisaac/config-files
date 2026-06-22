vim.api.nvim_create_autocmd('FileType', {
	pattern = { '*.purs' },
	callback = function() vim.treesitter.start() end,
})
