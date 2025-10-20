return {
	{
		'neovim/nvim-lspconfig',
		lazy = false,
		priority = 1,
		config = function()
			local open_diagnostic = function()
				vim.diagnostic.open_float({
					title = "Diagnostics",
					border = "rounded",
				}, { focus = false, scope = "cursor" })
			end
			vim.keymap.set('n', '<leader>]', open_diagnostic, { desc = 'Show diagnostics' })
			vim.keymap.set('n', 'g.', open_diagnostic, { desc = 'Show diagnostics' })

			-- Auto-show on hover with delay
			vim.api.nvim_create_autocmd({ "CursorHold" }, {
				callback = function()
					-- Only show if there are diagnostics on the current line
					local line = vim.api.nvim_win_get_cursor(0)[1] - 1
					local diagnostics = vim.diagnostic.get(0, { lnum = line })
					if #diagnostics > 0 then
						open_diagnostic()
					end
				end
			})

			-- Set hover delay
			vim.o.updatetime = 1500 -- 1.5 second delay
		end,
	},
	{
		'mfussenegger/nvim-lint',
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require('lint')

			lint.linters_by_ft = {
				javascript = { "biomejs" },
				typecript = { "biomejs" },
				vue = { "biomejs" },
				php = { "phpcs" }
				-- go = { "golangcilint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>li", function()
				lint.try_lint()
			end, { desc = "Attempt linting current file" })
		end,
	},
	-- {
	-- 	'glepnir/lspsaga.nvim',
	-- 	config = function()
	-- 		require('lspsaga').setup({
	-- 			error_sign = '',
	-- 			warn_sign = '',
	-- 			hint_sign = '󰋼',
	-- 			info_sign = '',
	-- 			lightbulb = {
	-- 				virtual_text = false
	-- 			},
	-- 			ui = {
	-- 				code_action = ''
	-- 			}
	-- 		})
	-- 	end,
	-- 	keys = {
	-- 		{ '<Space>d',   '<cmd>Lspsaga peek_definition<CR>',       desc = '(LSP) Peek Definition' },
	-- 		{ '<Space>D',   '<cmd>Lspsaga peek_type_definition<CR>',  desc = '(LSP) Peek Type Definition' },
	-- 		{ '<Space>j',   '<cmd>Lspsaga goto_definition<CR>',       desc = '(LSP) Go To Definition' },
	-- 		{ '<Space>J',   '<cmd>Lspsaga goto_type_definition<CR>',  desc = '(LSP) Go To Type Definition' },
	-- 		{ '<Space>i',   '<cmd>Lspsaga incoming_calls<CR>',        desc = '(LSP) Incoming Calls' },
	-- 		{ '<leader>]',  '<cmd>Lspsaga show_line_diagnostics<CR>', desc = '(LSP) Line Diagnostics' },
	-- 		{ '<leader>h',  '<cmd>Lspsaga hover_doc<CR>',             desc = '(LSP) Hover Doc' },
	-- 		{ '<leader>ca', '<cmd>Lspsaga code_action<CR>',           desc = '(LSP) Code Actions' },
	-- 		-- { 'F', function()
	-- 		--     if #vim.lsp.get_clients() > 0 then
	-- 		--        vim.lsp.buf.format()
	-- 		--    elseif vim.bo.formatprg ~= '' then
	-- 		--         vim.cmd('gggqG')
	-- 		--    else
	-- 		--        print "No formatter specified"
	-- 		--    end
	-- 		-- end, desc = '(LSP) Format file' },
	-- 	},
	-- 	init = function()
	-- 		-- Cursor diagnostic window
	-- 		vim.api.nvim_create_autocmd({ "CursorHold" }, {
	-- 			pattern = "*",
	-- 			callback = function()
	-- 				for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
	-- 					if vim.api.nvim_win_get_config(winid).zindex then
	-- 						return
	-- 					end
	-- 				end
	-- 				vim.diagnostic.open_float({
	-- 					scope = "cursor",
	-- 					focusable = false,
	-- 					close_events = {
	-- 						"CursorMoved",
	-- 						"CursorMovedI",
	-- 						"BufHidden",
	-- 						"InsertCharPre",
	-- 						"WinLeave",
	-- 					},
	-- 				})
	-- 			end
	-- 		})
	--
	-- 		-- Configure diagnostics
	-- 		vim.diagnostic.config {
	-- 			virtual_text = false,
	-- 			signs = {
	-- 				text = {
	-- 					[vim.diagnostic.severity.ERROR] = "",
	-- 					[vim.diagnostic.severity.WARN] = "",
	-- 					[vim.diagnostic.severity.HINT] = "󰋼",
	-- 					[vim.diagnostic.severity.INFO] = "",
	-- 				}
	-- 			}
	-- 		}
	-- 	end,
	-- 	dependencies = {
	-- 		'nvim-treesitter/nvim-treesitter',
	-- 		'nvim-tree/nvim-web-devicons'
	-- 	}
	-- }
}
