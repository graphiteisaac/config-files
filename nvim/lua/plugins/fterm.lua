return {
    'numToStr/FTerm.nvim',
    init = function()
        vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
        vim.api.nvim_create_user_command('Lazygit', function ()
            require('FTerm').run('lazygit')
        end, { bang = true })

        vim.keymap.set('n', '<leader>xt', function() 
           require('FTerm').toggle()
        end, {})
        vim.keymap.set('n', '<leader>xg', '<CMD>Lazygit<CR>', {})
        vim.keymap.set('t', '<C-n>', require('FTerm').exit, {})
    end,
    opts = {
        border = 'rounded',
        dimensions = {
            height = 0.9,
            width = 0.9,
        },
    }
}
