vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.gleam" },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
        vim.bo.expandtab = true
        vim.bo.smartindent = false
        vim.bo.commentstring = '//%s'
        vim.bo.comments = 's0:/*!,ex:*/,s1:/*,mb:*,ex:*/,:////,:///,://'
    end
})
