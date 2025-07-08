-- Optional: Set up file type associations
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.scm", "*.ss", "*.sls", "*.sps" },
	callback = function()
		vim.bo.filetype = "scheme"
		vim.g["conjure#client#scheme#stdio#command"] = "scheme"
		vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> "
	end,
})
