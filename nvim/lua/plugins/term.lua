return {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = function() 
        local Term = require('toggleterm.terminal').Terminal
        local lazygit = Term:new({ cmd = "lazygit", hidden = true, direction = 'float' })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        return {
            { '<leader>xt', "<cmd>ToggleTerm<CR>", desc = 'Toggle Floating Term' },
            { '<leader>xg', "<cmd>lua _lazygit_toggle()<CR>", desc = 'Lazygit' },
            { '<C-x>', [[<C-\><C-n>]], 't', desc = 'Close Terminal' },
        }
    end,
    opts = {
        size = 0.9,
        hidden = true,
        direction = 'float',
        float_opts = {
            border = 'rounded',
        },
    }
}
