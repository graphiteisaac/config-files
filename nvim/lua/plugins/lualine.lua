return {
    'nvim-lualine/lualine.nvim',
    opts = function()
        local lualine_require = require('lualine_require')
        local modules = lualine_require.lazy_require {
            utils = 'lualine.utils.utils',
            highlight = 'lualine.highlight'
        }

        local diagnostics_message = require("lualine.component"):extend()

        diagnostics_message.default = {
            colors = {
                error = modules.utils.extract_color_from_hllist(
                    { "fg", "sp" },
                    { "DiagnosticError" },
                    "#e32636"
                ),
                warning = modules.utils.extract_color_from_hllist(
                    { "fg", "sp" },
                    { "DiagnosticWarn" },
                    "#ffa500"
                ),
                info = modules.utils.extract_color_from_hllist(
                    { "fg", "sp" },
                    { "DiagnosticInfo" },
                    "#ffffff"
                ),
                hint = modules.utils.extract_color_from_hllist(
                    { "fg", "sp" },
                    { "DiagnosticHint" },
                    "#273faf"
                ),
            },
        }


        function diagnostics_message:init(options)
            diagnostics_message.super:init(options)
            self.options.colors = {}
            self.highlights = {
                error = "DiagnosticSignError",
                warn = "DiagnosticSignWarn",
                info =
                "DiagnosticSignInfo",
                hint = "DiagnosticSignHint"
            }

            self.highlights.error = modules.highlight.create_component_highlight_group(
                { fg = "DiagnosticSignError" },
                "diagnostics_message_error",
                self.options
            )
            self.highlights.warn = modules.highlight.create_component_highlight_group(
                { fg = "DiagnosticSignWarn" },
                "diagnostics_message_warn",
                self.options
            )
            self.highlights.info = modules.highlight.create_component_highlight_group(
                { fg = "DiagnosticSignInfo" },
                "diagnostics_message_info",
                self.options
            )
            self.highlights.hint = modules.highlight.create_component_highlight_group(
                { fg = "DiagnosticSignHint" },
                "diagnostics_message_hint",
                self.options
            )
        end

        function diagnostics_message:update_status()
            local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
            local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
            if #diagnostics > 0 then
                local diag = diagnostics[1]
                for _, d in ipairs(diagnostics) do
                    if d.severity < diag.severity then
                        diagnostics = d
                    end
                end
                local icons = { "", "󰋼", "", "" }
                local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
                return modules.highlight.component_format_highlight(hl[diag.severity]) ..
                    icons[diag.severity] .. " " .. diag.message
            else
                return ""
            end
        end

        return {
            options = {
                theme = 'catppuccin',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = { 'NvimTree' }
            },
            tabline = {},
            winbar = {},
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = { "diagnostics" },
                lualine_x = { },
                lualine_y = {
                    {
                        function()
                            local msg = 'None'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then
                                return msg
                            end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return client.name 
                                end
                            end
                            return msg
                        end,
                        icon = '󰈙',
                        color = { gui = 'bold' },
                    },
                    { 'filetype' }
                },
                lualine_z = { "location" },
            }
        }
    end
}
