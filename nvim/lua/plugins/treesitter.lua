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
		local ts_parsers = {
			-- web languages
			'twig', 'gleam', 'typescript', 'javascript', 'vue', 'css', 'php', 'tsx', 'jsx', 'typescriptreact',
			'javascriptreact', 'sql', 'hbs', 'handlebars',
			-- fun and experimental
			'pony', 'lisp', 'scheme',
			-- systems, other, etc.
			'go', 'rust', 'ocaml',
			-- config and writing
			'djot', 'yaml', 'json', 'lua', 'markdown'
		}

		local nts = require("nvim-treesitter")
		nts.install(ts_parsers)

		vim.api.nvim_create_autocmd('FileType', {
			callback = function(args)
				local filetype = args.match
				local lang = vim.treesitter.language.get_lang(filetype)

				if vim.treesitter.language.add(lang) then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
					vim.treesitter.start()
				end
			end,
		})
	end
}
