return {
    {
        'neovim/nvim-lsp',
    },
    {
        'glepnir/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                error_sign = '',
                warn_sign = '',
                hint_sign = '',
                info_sign = '',
                lightbulb = {
                    virtual_text = false
                },
                ui = {
                    code_action = ''
                }
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    }
}
