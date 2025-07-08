return {
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
	gopls = {
	  analyses = {
		unusedparams = true,
	  },
	  staticcheck = true,
	},
  },
}
