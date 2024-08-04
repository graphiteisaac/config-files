vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.gleam" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
    end
})
