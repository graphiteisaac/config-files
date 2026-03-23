vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'Caddyfile', 'Caddyfile.*' },
	callback = function() vim.treesitter.start() end,
})
