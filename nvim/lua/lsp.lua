local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require("lspconfig")
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
nvim_lsp.denols.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    on_attach = on_attach,
    ---init_options = {
    ---   lint = true
    ---}
}
nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    on_attach = on_attach,
    single_file_support = false
}

--- sqls
nvim_lsp.sqlls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

--- Frontend servers
nvim_lsp.volar.setup {
    capabilities = capabilities,
}
nvim_lsp.svelte.setup {
    capabilities = capabilities,
}

nvim_lsp.zls.setup {
    capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
    capabilities = capabilities
}

util = require "lspconfig/util"
nvim_lsp.gopls.setup {
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}
