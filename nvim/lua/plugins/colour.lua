--[[return {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    opts = {
        'css',
        'javascript',
        html = {
            mode = 'foreground'
        }
    }
}]]

return {
    'uga-rosa/ccc.nvim',
    event = 'BufEnter',
    init = function()
        vim.keymap.set('n', '<leader>cp', "<cmd>:CccPick<CR>", {})
        vim.keymap.set('n', '<leader>cc', "<cmd>:CccConvert<CR>", {})
        vim.keymap.set('n', '<leader>ct', "<cmd>:CccHighlighterToggle<CR>", {})
    end,
    opts = {
        highlighter = {
            auto_enable = true,
            lsp = true,
        }
    },
}
