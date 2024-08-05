return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    keys = {
        { '<leader>ff', require('telescope.builtin').find_files, desc = '(Telescope) Find Files' },
        { '<leader>fg', require('telescope.builtin').find_files, desc = '(Telescope) Grep' },
        { '<leader>fb', require('telescope.builtin').find_files, desc = '(Telescope) Open Buffers' },
        { '<leader>fd', require('telescope.builtin').find_files, desc = '(Telescope) Diagnostics' },
        { '<leader>fh', require('telescope.builtin').oldfiles, desc = '(Telescope) Historic Files' },
    },
}
