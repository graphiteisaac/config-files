return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	branch = 'main',
	build = ':TSUpdate',
	opts = {
		options = {
			highlight = {
				disable = { 'help', 'doc' },
			}
		}
	},
	config = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'twig', 'gleam', 'typescript', 'javascript', 'vue', 'css', 'go', 'rust', 'djot', 'php', 'pony', 'lisp', 'tsx', 'jsx', 'typescriptreact', 'javascriptreact', 'scheme', 'ocaml', 'sql' },
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end
}
