local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
		'/vue-language-server' .. '/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vue_language_server_path,
	languages = { 'vue' },
	configNamespace = 'typescript',
}

local config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}

-- -- Debug output
-- print("ts_ls config filetypes:", vim.inspect(config.filetypes))
-- print("Vue plugin location:", vue_plugin.location)

return config
