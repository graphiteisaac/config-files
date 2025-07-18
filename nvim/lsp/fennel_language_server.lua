return {
  cmd = 'fennel-language-server',
  filetypes = { 'fennel' },
  single_file_support = true,
  settings = {
	fennel = {
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
