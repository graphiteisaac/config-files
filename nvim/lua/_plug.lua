local plugins = {
    {
        'williamboman/mason-lspconfig.nvim',
    },
    {
        'mattn/emmet-vim'
    },
    {
        'mustache/vim-mustache-handlebars'
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'windwp/nvim-ts-autotag'
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
    },
    {
        'windwp/nvim-autopairs'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'saecki/crates.nvim'
    },
    {
        'lepture/vim-jinja'
    },
    --[[{
        'simrat39/rust-tools.nvim',
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        }

    },
    {
        'yamatsum/nvim-cursorline',
        opts = {
            cursorline = {
                enable = true,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                h1 = { underline = true },
            }
        }
    },]]
}

return plugins
