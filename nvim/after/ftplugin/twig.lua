vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "FileType"}, {
    pattern = { "*.twig" },
    callback = function(details)
        print(details.event)
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
--        vim.bo.smarttab = true

--        print(vim.o.tabstop)
    end
})
