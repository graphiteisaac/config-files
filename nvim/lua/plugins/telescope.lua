return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = '(Telescope) Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = '(Telescope) Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = '(Telescope) Open Buffers' },
        { '<leader>fd', '<cmd>Telescope diagnostics<CR>', desc = '(Telescope) Diagnostics' },
        { '<leader>fh', '<cmd>Telescope oldfiles<CR>', desc = '(Telescope) Historic Files' },
    },
}
