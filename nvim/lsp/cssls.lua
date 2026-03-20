return {
	cmd = { 'vscode-css-language-server', '--stdio' },
	filetypes = { 'css', 'scss', 'less' },
	init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
	root_markers = { 'package.json', '.git' },
	single_file_support = true,
	settings = {
		css = {
			validate = true,
			format = {
				indentSize = 2,
				insertSpaces = true,
			}
		},
		scss = {
			validate = true,
			format = {
				indentSize = 2,
				insertSpaces = true,
			}
		},
		less = {
			validate = true,
			format = {
				indentSize = 2,
				insertSpaces = true,
			}
		},
	},
	on_attach = function(_client, bufnr)
		vim.bo[bufnr].shiftwidth = 2
		vim.bo[bufnr].tabstop = 2
		vim.bo[bufnr].softtabstop = 2
		vim.bo[bufnr].expandtab = true
	end,
}
