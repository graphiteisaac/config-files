return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'garymjr/nvim-snippets',
		'rafamadriz/friendly-snippets',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline'
	},
	init = function()
		local cmp = require('cmp')

		require('snippets').setup({
			friendly_snippets = true,
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif vim.snippet.active({ direction = 1 }) then
						vim.snippet.jump(1)
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.snippet.active({ direction = -1 }) then
						vim.snippet.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<CR>'] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'snippets' },
			}, {
				{ name = 'buffer' }
			})
		})
	end
}
