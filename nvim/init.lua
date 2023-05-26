vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local Plug = vim.fn['plug#']

-- Standard Vim / Neovim settings
vim.o.mouse = 'v'
vim.o.number = true
-- vim.o.nocompatible = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.wildmode = 'longest,list'
vim.o.cc = 80
vim.o.syntax = 'on'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.ttyfast = true

vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
--  Plug('kaicataldo/material.vim', { branch = 'main' })
  Plug 'EdenEast/nightfox.nvim'
  Plug 'mattn/emmet-vim'
  Plug 'sigmasd/deno-nvim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'voldikss/vim-floaterm'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'ziglang/zig.vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'm4xshen/autoclose.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kdheepak/tabline.nvim'
  Plug 'neovim/nvim-lsp'
  Plug 'glepnir/lspsaga.nvim'
  Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.1' })
  Plug('L3MON4D3/LuaSnip', {['tag'] = 'v1.*', ['do'] = 'make install_jsregexp'})
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'saecki/crates.nvim'
  Plug 'saadparwaiz1/cmp_luasnip'
vim.call('plug#end')

-- Terminal GUI colours
if vim.call('has', 'termguicolors') then
  vim.o.termguicolors=true
end

-- Theme
--vim.g.material_theme_style = 'darker'
vim.cmd('colorscheme nightfox')

-- Plugin config
require('keys')
require('comp')
--require('coc')
require('lualine').setup {
    options = {
        theme = 'auto',
        disabled_filetypes = { 'NvimTree' }
    }
}
require('tabline').setup {
    enable = true,
}
require("autoclose").setup()
require("nvim-tree").setup()
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('crates').setup()

local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup {
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    on_attach = on_attach,
    init_options = {
        lint = true
    }
}
nvim_lsp.tsserver.setup {
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    on_attach = on_attach,
    single_file_support = false
}
nvim_lsp.svelte.setup {}
nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
util = require "lspconfig/util"
nvim_lsp.gopls.setup {
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


require('deno-nvim').setup {}

local saga = require('lspsaga')
saga.setup {}


-- Split panes config
vim.cmd('set splitright')
vim.cmd('set splitbelow')

