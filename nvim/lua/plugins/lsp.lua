return {
    {
        'neovim/nvim-lsp',
    },
    {
        'mfussenegger/nvim-lint',
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require('lint')

            lint.linters_by_ft = {
                javascript = { "biomejs" },
                typecript = { "biomejs" },
                vue = { "biomejs" },
                -- go = { "golangcilint" },
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>li", function()
                lint.try_lint()
            end, { desc = "Attempt linting current file" })
        end,
    },
    {
        'glepnir/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                error_sign = '',
                warn_sign = '',
                hint_sign = '󰋼',
                info_sign = '',
                lightbulb = {
                    virtual_text = false
                },
                ui = {
                    code_action = ''
                }
            })
        end,
        keys = {
            { '<Space>d', '<cmd>Lspsaga peek_definition<CR>', desc = '(LSP) Peek Definition' },
            { '<Space>D', '<cmd>Lspsaga peek_type_definition<CR>', desc = '(LSP) Peek Type Definition' },
            { '<Space>j', '<cmd>Lspsaga goto_definition<CR>', desc = '(LSP) Go To Definition' },
            { '<Space>J', '<cmd>Lspsaga goto_type_definition<CR>', desc = '(LSP) Go To Type Definition' },
            { '<Space>i', '<cmd>Lspsaga incoming_calls<CR>', desc = '(LSP) Incoming Calls' },
            { '<leader>]', '<cmd>Lspsaga show_line_diagnostics<CR>', desc = '(LSP) Line Diagnostics' },
            { '<leader>h', '<cmd>Lspsaga hover_doc<CR>', desc = '(LSP) Hover Doc' },
            { '<leader>ca', '<cmd>Lspsaga code_action<CR>', desc = '(LSP) Code Actions' },
            { 'F', function()
                if #vim.lsp.get_clients() > 0 then
                   vim.lsp.buf.format()
               elseif vim.bo.formatprg ~= '' then
                    vim.cmd('gggqG')
               else
                   print "No formatter specified"
               end
            end, desc = '(LSP) Format file' },
        },
        init = function()
            -- Cursor diagnostic window
            vim.api.nvim_create_autocmd({ "CursorHold" }, {
                pattern = "*",
                callback = function()
                    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                        if vim.api.nvim_win_get_config(winid).zindex then
                            return
                        end
                    end
                    vim.diagnostic.open_float({
                        scope = "cursor",
                        focusable = false,
                        close_events = {
                            "CursorMoved",
                            "CursorMovedI",
                            "BufHidden",
                            "InsertCharPre",
                            "WinLeave",
                        },
                    })
                end
            })

            -- Remove virtual text
            vim.diagnostic.config {
                virtual_text = false
            }

            -- Set gutter signs to nice icons
            vim.fn.sign_define(
                "DiagnosticSignError",
                { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
            )
            vim.fn.sign_define(
                "DiagnosticSignWarn",
                { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
            )
            vim.fn.sign_define(
                "DiagnosticSignHint",
                { texthl = "DiagnosticSignHint", text = "󰋼", numhl = "DiagnosticSignHint" }
            )
            vim.fn.sign_define(
                "DiagnosticSignInfo",
                { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" }
            )
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    }
}
