return {
    'nvim-telescope/telescope.nvim',
	branch = 'master',
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = '(Telescope) Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = '(Telescope) Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = '(Telescope) Open Buffers' },
        { '<leader>fd', '<cmd>Telescope diagnostics<CR>', desc = '(Telescope) Diagnostics' },
        { '<leader>fh', '<cmd>Telescope oldfiles<CR>', desc = '(Telescope) Historic Files' },
    },
}
