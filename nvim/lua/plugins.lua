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
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
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
        opts = function()
            function GetCurrentDiagnostic()
                bufnr = 0
                line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
                opts = { ["lnum"] = line_nr }

                local line_diagnostics = vim.diagnostic.get(bufnr, opts)
                if vim.tbl_isempty(line_diagnostics) then
                    return
                end

                local best_diagnostic = nil

                for _, diagnostic in ipairs(line_diagnostics) do
                    if
                        best_diagnostic == nil or diagnostic.severity < best_diagnostic.severity
                    then
                        best_diagnostic = diagnostic
                    end
                end

                return best_diagnostic
            end

            function GetCurrentDiagnosticString()
                local diagnostic = GetCurrentDiagnostic()

                if not diagnostic or not diagnostic.message then
                    return
                end

                local message = vim.split(diagnostic.message, "\n")[1]
                local max_width = vim.api.nvim_win_get_width(0) - 35

                if string.len(message) < max_width then
                    return message
                else
                    return string.sub(message, 1, max_width) .. "..."
                end
            end

            return {
                options = {
                    theme = 'catppuccin',
                    disabled_filetypes = { 'NvimTree' }
                },
                tabline = {},
                winbar = {},
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "diagnostics",
                    },
                    lualine_c = { "GetCurrentDiagnosticString()" },
                    lualine_y = {
                        {
                            function()
                                local msg = 'None'
                                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                                local clients = vim.lsp.get_active_clients()
                                if next(clients) == nil then
                                    return msg
                                end
                                for _, client in ipairs(clients) do
                                    local filetypes = client.config.filetypes
                                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                        return client.name
                                    end
                                end
                                return msg
                            end,
                            icon = '󰈙',
                            color = { gui = 'bold' },
                        }
                    },
                    lualine_x = {},
                    lualine_z = { "location" },
                }
            }
        end
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
            options = {
                error_sign = '', -- 
                warn_sign = '',
                hint_sign = '',
                infor_sign = ''
            }
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
