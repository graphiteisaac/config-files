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

        require('mason-lspconfig').setup_handlers {
            function(server)
                require('lspconfig')[server].setup {
                    capabilities = capabilities
                }
            end,
            ["denols"] = function()
                return require('lspconfig').denols.setup {
                    capabilities = capabilities,
                    root_dir = util.root_pattern("deno.json", "deno.jsonc"),
                    init_options = {
                        lint = true
                    }
                }
            end,
            ["tsserver"] = function()
                return require('lspconfig').tsserver.setup {
                    capabilities = capabilities,
                    root_dir = util.root_pattern("package.json"),
                    single_file_support = false
                }
            end
        }
    end
}