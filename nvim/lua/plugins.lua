local plugins = {
    {
        'nvim-tree/nvim-tree.lua',
        event = 'VeryLazy',
    },
    {
        'folke/trouble.nvim',
        event = 'VeryLazy'
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'numToStr/Comment.nvim',
        init = function()
            require('Comment').setup {}
        end,
        lazy = false,
    },
    {
        'stevearc/dressing.nvim'
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
            local lualine_require = require('lualine_require')
            local modules = lualine_require.lazy_require {
                utils = 'lualine.utils.utils',
                highlight = 'lualine.highlight'
            }

            local diagnostics_message = require("lualine.component"):extend()

            diagnostics_message.default = {
                colors = {
                    error = modules.utils.extract_color_from_hllist(
                        { "fg", "sp" },
                        { "DiagnosticError" },
                        "#e32636"
                    ),
                    warning = modules.utils.extract_color_from_hllist(
                        { "fg", "sp" },
                        { "DiagnosticWarn" },
                        "#ffa500"
                    ),
                    info = modules.utils.extract_color_from_hllist(
                        { "fg", "sp" },
                        { "DiagnosticInfo" },
                        "#ffffff"
                    ),
                    hint = modules.utils.extract_color_from_hllist(
                        { "fg", "sp" },
                        { "DiagnosticHint" },
                        "#273faf"
                    ),
                },
            }


            function diagnostics_message:init(options)
                diagnostics_message.super:init(options)
                self.options.colors = {}
                self.highlights = { error = "DiagnosticSignError", warn = "DiagnosticSignWarn", info = "DiagnosticSignInfo", hint = "DiagnosticSignHint" }

                self.highlights.error = modules.highlight.create_component_highlight_group(
                    { fg = "DiagnosticSignError" },
                    "diagnostics_message_error",
                    self.options
                )
                self.highlights.warn = modules.highlight.create_component_highlight_group(
                    { fg = "DiagnosticSignWarn" },
                    "diagnostics_message_warn",
                    self.options
                )
                self.highlights.info = modules.highlight.create_component_highlight_group(
                    { fg = "DiagnosticSignInfo" },
                    "diagnostics_message_info",
                    self.options
                )
                self.highlights.hint = modules.highlight.create_component_highlight_group(
                    { fg = "DiagnosticSignHint" },
                    "diagnostics_message_hint",
                    self.options
                )
            end

            function diagnostics_message:update_status()
                local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
                local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
                if #diagnostics > 0 then
                    local diag = diagnostics[1]
                    for _, d in ipairs(diagnostics) do
                        if d.severity < diag.severity then
                            diagnostics = d
                        end
                    end
                    local icons = { "", "󰋼", "", "" }
                    local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
                    return modules.highlight.component_format_highlight(hl[diag.severity]) ..
                        icons[diag.severity] .. " " .. diag.message
                else
                    return ""
                end
            end

            return {
                options = {
                    theme = 'catppuccin',
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = { 'NvimTree' }
                },
                tabline = {},
                winbar = {},
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "diagnostics" },
                    lualine_c = { --[[diagnostics_message]] },
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
                        },
                        { 'filetype' }
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
        'neovim/nvim-lsp',
        config = function()
            require('lsp')
        end
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
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
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
