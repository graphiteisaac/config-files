-- keys.lua
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Floaterm
vim.api.nvim_set_var('floaterm_keymap_new', '<F7>')
vim.api.nvim_set_var('floaterm_keymap_toggle', '<F12>')
map('n', '<Space>t', ':NvimTreeToggle<CR>')
map('n', '<Space>f', ':Telescope find_files<CR>')
map('n', '<Space>d', ':Lspsaga peek_definition<CR>')
map('n', '<Space>D', ':Lspsaga peek_type_definition<CR>')
map('n', '<Space>j', ':Lspsaga goto_definition<CR>')
map('n', '<Space>J', ':Lspsaga goto_type_definition<CR>')
