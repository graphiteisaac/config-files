return {
    'nvim-treesitter/nvim-treesitter',
	lazy = false,
	branch = 'main',
    build = ':TSUpdate',
    opts = {
        options = {
            highlight = {
                disable = { 'help', 'doc' },
            }
        }
    },
    config = function()
    end
}
