local plugins = {
    {
        'nvim-tree/nvim-tree.lua'
    },
    {
        'preservim/nerdcommenter'
    },
    {
        'mhinz/vim-startify'
    },
    {
        'folke/todo-comments.nvim'
    },
    {
        'williamboman/mason.nvim',
        opts = function()
            require("mason").setup {}
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
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
        'voldikss/vim-floaterm'
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'ziglang/zig.vim'
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'auto',
                disabled_filetypes = { 'NvimTree' }
            }
        }
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local nvim_lsp = require("lspconfig")
            nvim_lsp.clangd.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            nvim_lsp.denols.setup {
                capabilities = capabilities,
                root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
                on_attach = on_attach,
                ---init_options = {
                ---   lint = true
                ---}
            }
            nvim_lsp.tsserver.setup {
                capabilities = capabilities,
                root_dir = nvim_lsp.util.root_pattern("package.json"),
                on_attach = on_attach,
                single_file_support = false
            }

            --- sqls
            nvim_lsp.sqlls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            --- Frontend servers
            nvim_lsp.volar.setup {
                capabilities = capabilities,
            }
            nvim_lsp.svelte.setup {
                capabilities = capabilities,
            }
            nvim_lsp.zls.setup {
                capabilities = capabilities
            }

            util = require "lspconfig/util"
            nvim_lsp.gopls.setup {
                capabilities = capabilities,
                cmd = {"gopls", "serve"},
                filetypes = {"go", "gomod"},
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                  gopls = {
                    analyses = {
                      unusedparams = true,
                    },
                    staticcheck = true,
                  },
                },
            }
        end
    },
    {
        'glepnir/lspsaga.nvim',
        opts = function()
		    require('lspsaga').setup {
	    		error_sign = '', -- 
		        warn_sign = '',
		        hint_sign = '',
    		    infor_sign = '',
	        }
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
        config = function()
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
    {
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

    },
    {
        'olexsmir/gopher.nvim', 
        build = ':GoInstallDeps'
    }
}

return plugins
