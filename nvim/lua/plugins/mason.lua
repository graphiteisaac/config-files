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
            ["ts_ls"] = function()
                local vue_location = require('mason-registry').get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

                return require('lspconfig').ts_ls.setup {
                    capabilities = capabilities,
                    root_dir = util.root_pattern("package.json"),
                    single_file_support = false,
                    init_options = {
                        plugins = {
                            {
                                name = '@vue/typescript-plugin',
                                location = vue_location,
                                languages = { 'vue' },
                            },
                        },
                    },
                    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                }
            end,
            ["volar"] = function ()
                require('lspconfig').volar.setup {}
            end,
        }
    end
}
