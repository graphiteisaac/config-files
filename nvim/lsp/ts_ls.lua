-- local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server'

return {
	cmd = { "typescript-language-server", "--stdio" },
	root_markers = { 'package.json' },
	workspace_required = true,
	init_options = {
		vue = {
			hybridMode = false,
		},
		typescript = {
			tsdk = vim.fn.getcwd() .. '/node_modules/typescript/lib'
		}
	},
	filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue' },
}
