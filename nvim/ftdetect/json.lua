vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.json", "*.jsonc" },
    callback = function()
        vim.bo.formatprg = 'jq'
    end
})
