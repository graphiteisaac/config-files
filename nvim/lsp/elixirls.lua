return {
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/elixir-ls") },
	filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
	root_markers = { 'mix.exs', '.git' },
	settings = {
		elixirLS = {
			dialyzerEnabled = false,
			fetchDeps = false,
		}
	}
}
