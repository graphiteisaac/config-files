-- keys.lua
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<Space>t', ':NvimTreeToggle<CR>')
map('n', '<Space>d', ':Lspsaga peek_definition<CR>')
map('n', '<Space>D', ':Lspsaga peek_type_definition<CR>')
map('n', '<Space>j', ':Lspsaga goto_definition<CR>')
map('n', '<Space>J', ':Lspsaga goto_type_definition<CR>')
map('n', '<Space>i', ':Lspsaga incoming_calls<CR>')
map('n', '<leader>]', ':Lspsaga show_line_diagnostics<CR>')
map('n', '<A-CR>', ':Lspsaga code_action<CR>')
map('n', '<leader>t', ':TroubleToggle<CR>')

map('n', 'F', ':lua vim.lsp.buf.format()')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', 'F', vim.lsp.buf.format, {})

vim.keymap.set('n', 'V', vim.diagnostic.open_float, {})
vim.cmd([[au CursorHold * lua vim.diagnostic.open_float(0,{scope = "cursor"})]])
