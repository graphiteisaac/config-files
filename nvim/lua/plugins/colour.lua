return {
    'uga-rosa/ccc.nvim',
    event = 'BufEnter',
    keys = {
        { '<leader>cp', '<cmd>:CccPick<CR>', desc = 'Open colour picker' },
        { '<leader>cc', '<cmd>:CccConvert<CR>', desc = 'Convert colour format' },
        { '<leader>ct', '<cmd>:CccHighlighterToggle<CR>', desc = 'Toggle Colour Highligning' },
    },
    opts = {
        highlighter = {
            auto_enable = true,
            lsp = true,
        }
    },
}
