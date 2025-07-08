return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end

			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome" },
			typescript = { "biome" },
			go = { "gofmt", "goimports" },
			gleam = { "gleam" },
			php = { "prettier", "php-cs-fixer", "pretty-php" }
		}
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		vim.keymap.set("n", "F", require 'conform'.format, { silent = true })
		-- vim.api.nvim_create_autocmd("BufWritePre", {
		-- 	pattern = "*",
		-- 	callback = function(args)
		-- 		require("conform").format({ bufnr = args.buf })
		-- 	end,
		-- })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end
}
