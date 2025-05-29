local util = require("lspconfig/util")

return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    opts = {},
    config = function()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup()
        require('mason-lspconfig').setup()

        -- FIXME: check if Gleam is installed
        require('lspconfig').gleam.setup {
            capabilities = capabilities
        }

						--   require('mason-lspconfig').setup_handlers {
						--       function(server)
						--           require('lspconfig')[server].setup {
						--               capabilities = capabilities
						--           }
						--       end,
						--  ["gopls"] = function()
						-- 		 return require('lspconfig').gopls.setup {
						-- 				 capabilities = capabilities,
						-- --          on_attach = function()
						-- -- -- Trying out Conform 
						-- -- --
						-- --              -- vim.api.nvim_create_autocmd("BufWritePre", {
						-- --              --     pattern = "*.go",
						-- --              --     callback = function()
						-- --              --         local params = vim.lsp.util.make_range_params()
						-- --              --         params.context = { only = { "source.organizeImports" } }
						-- --              --         -- buf_request_sync defaults to a 1000ms timeout. Depending on your
						-- --              --         -- machine and codebase, you may want longer. Add an additional
						-- --              --         -- argument after params if you find that you have to write the file
						-- --              --         -- twice for changes to be saved.
						-- --              --         -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
						-- --              --         local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
						-- --              --         for cid, res in pairs(result or {}) do
						-- --              --             for _, r in pairs(res.result or {}) do
						-- --              --                 if r.edit then
						-- --              --                     local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
						-- --              --                     vim.lsp.util.apply_workspace_edit(r.edit, enc)
						-- --              --                 end
						-- --              --             end
						-- --              --         end
						-- --              --         vim.lsp.buf.format({ async = false })
						-- --              --     end
						-- --              -- })
						-- --          end,
						-- 				 cmd = { "gopls", "serve" },
						-- 				 filetypes = { "go", "gomod" },
						-- 				 root_dir = util.root_pattern("go.work", "go.mod", ".git"),
						-- 				 settings = {
						-- 						 gopls = {
						-- 								 analyses = {
						-- 										 unusedparams = true,
						-- 								 },
						-- 								 staticcheck = true,
						-- 						 },
						-- 				 },
						-- 		 }
						--  end,
						--       ["denols"] = function()
						--           return require('lspconfig').denols.setup {
						--               capabilities = capabilities,
						--               root_dir = util.root_pattern("deno.json", "deno.jsonc"),
						--               single_file_suppoort = false,
						--               init_options = {
						--                   lint = true
						--               }
						--           }
						--       end,
						--       ["ts_ls"] = function()
						--           local vue_location = require('mason-registry').get_package('vue-language-server'):get_install_path() ..
						--               '/node_modules/@vue/language-server'
						--
						--           return require('lspconfig').ts_ls.setup {
						--               capabilities = capabilities,
						--               root_dir = util.root_pattern("package.json"),
						--               single_file_support = false,
						--               init_options = {
						--                   plugins = {
						--                       {
						--                           name = '@vue/typescript-plugin',
						--                           location = vue_location,
						--                           languages = { 'vue' },
						--                       },
						--                   },
						--               },
						--               filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
						--           }
						--       end,
						--       ["volar"] = function()
						--           require('lspconfig').volar.setup {}
						--       end,
						--       ["fennel_language_server"] = function()
						--           require('lspconfig').fennel_language_server.setup {
						--               capabilities = capabilities,
						--               filetypes = { 'fennel' },
						--               single_file_support = true,
						--               -- source code resides in directory `fnl/`
						--               -- root_dir = util.root_pattern("fnl"),
						--               settings = {
						--                   fennel = {
						--                       workspace = {
						--                           -- If you are using hotpot.nvim or aniseed,
						--                           -- make the server aware of neovim runtime files.
						--                           library = vim.api.nvim_list_runtime_paths(),
						--                       },
						--                       diagnostics = {
						--                           globals = { 'vim' },
						--                       },
						--                   },
						--               },
						--           }
						--       end,
						--   }
    end
}
