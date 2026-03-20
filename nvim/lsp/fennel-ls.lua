return {
	cmd = { 'fennel-ls' },
	filetypes = { 'fennel', 'fnl' },
	single_file_support = true,
	settings = {
		fennel = {
			love2d = true,
			love = true,
			workspace = {
				-- If you are using hotpot.nvim or aniseed,
				-- make the server aware of neovim runtime files.
				library = vim.api.nvim_list_runtime_paths(),
			},
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
}
