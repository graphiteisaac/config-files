local capabilities = require('cmp_nvim_lsp').default_capabilities()

local svelte_capabilities = vim.deepcopy(capabilities)
svelte_capabilities.textDocument.completion.completionItem.snippetSupport = false

return {
	capabilities = svelte_capabilities,
}
