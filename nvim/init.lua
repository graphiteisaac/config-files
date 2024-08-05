-- Standard Vim / Neovim settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.mouse = 'v'
vim.o.number = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wildmode = 'longest,list'
vim.o.syntax = 'on'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.signcolumn = 'yes'
vim.o.backupcopy = 'yes'
vim.o.textwidth = 0
vim.o.splitright = true
vim.o.splitbelow = true

-- Terminal GUI colours
if vim.call('has', 'termguicolors') then
    vim.o.termguicolors = true
end

-- Disable unenlightened arrow keys in normal mode
vim.keymap.set('n', '<Up>', '<Nop', {})
vim.keymap.set('n', '<Down>', '<Nop', {})
vim.keymap.set('n', '<Left>', '<Nop', {})
vim.keymap.set('n', '<Right>', '<Nop', {})

-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')
