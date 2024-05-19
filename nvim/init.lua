-- Standard Vim / Neovim settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.mouse = 'v'
vim.o.number = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.wildmode = 'longest,list'
vim.o.syntax = 'on'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.signcolumn = 'yes'

-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')

-- Terminal GUI colours
if vim.call('has', 'termguicolors') then
    vim.o.termguicolors = true
end

-- Theme
vim.cmd('colorscheme catppuccin')

-- Plugin config
require('keys')

-- Split panes config
vim.cmd('set splitright')
vim.cmd('set splitbelow')

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go,*.svelte,*.html,*.js,*.ts,*.tsx,*.jsx,*.lua",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

--vim.cmd [[au BufNewFile,BufRead *.njk set ft=jinja]]

vim.fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
    "DiagnosticSignWarn",
    { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
    "DiagnosticSignHint",
    { texthl = "DiagnosticSignHint", text = "󰋼", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
    "DiagnosticSignInfo",
    { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
)
