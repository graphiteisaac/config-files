local plugins = {
    {
        'nvim-tree/nvim-tree.lua'
    },
    {
        'preservim/nerdcommenter'
    },
    {
        'folke/trouble.nvim'
    },
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        init = function()
            require 'alpha'.setup(require 'alpha.themes.theta'.config)
        end
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {}
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        opts = {
            options = {
                highlight = {
                    disable = { 'help', 'doc' },
                }
            }
        }
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin'
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
        'ziglang/zig.vim'
    },
    {
        'akinsho/bufferline.nvim',
        after = "catppuccin",
        config = function()
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get(),
                options = {
                    diagnostics = 'nvim_lsp',
                    separator_style = 'slant',
                    hover = {
                        enabled = true,
                    }
                }
            }
        end,
        version = "*",
        dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'catppuccin',
                disabled_filetypes = { 'NvimTree' }
            },
            tabline = {},
            winbar = {}
        }
    },
    {
        'windwp/nvim-ts-autotag'
    },
    {
        'nvim-lua/plenary.nvim'
    },
    {
        'neovim/nvim-lsp'
    },
    {
        'glepnir/lspsaga.nvim',
        opts = {
            error_sign = '', -- 
            warn_sign = '',
            hint_sign = '',
            infor_sign = '',
        },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'windwp/nvim-autopairs'
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5'
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {
                'L3MON4D3/LuaSnip'
            },
            {
                'saadparwaiz1/cmp_luasnip'
            },
            {
                'hrsh7th/cmp-buffer'
            },
            {
                'hrsh7th/cmp-path'
            },
            {
                'hrsh7th/cmp-cmdline'
            },
        },
        init = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' }
                })
            })
        end
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
    {
        'olexsmir/gopher.nvim',
        build = ':GoInstallDeps'
    }
}

return plugins
