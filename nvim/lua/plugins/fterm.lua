return {
    'numToStr/FTerm.nvim',
    keys = {
        { '<leader>xt', require('FTerm').toggle, desc = 'Toggle Floating Term' },
        { '<leader>xg', function()
            require('FTerm').run('lazygit')
        end, desc = 'Lazygit' },
        { '<C-n>', require('FTerm').exit, 't', desc = 'Close Terminal' }
    },
    opts = {
        border = 'rounded',
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    }
}
