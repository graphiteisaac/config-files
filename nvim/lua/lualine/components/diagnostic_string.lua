-- local lualine_require = require('lualine.lua.lualine_require')
--[[local modules = lualine_require.lazy_require {
    utils = 'lualine.utils.utils',
    highlight = 'lualine.highlight'
}]]

local diagnostics_message = require("lualine.component"):extend()

--[[diagnostics_message.default = {
    colors = {
        error = modules.utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticError", "LspDiagnosticsDefaultError", "DiffDelete" },
            "#e32636"
        ),
        warning = modules.utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticWarn", "LspDiagnosticsDefaultWarning", "DiffText" },
            "#ffa500"
        ),
        info = modules.utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticInfo", "LspDiagnosticsDefaultInformation", "DiffChange" },
            "#ffffff"
        ),
        hint = modules.utils.extract_color_from_hllist(
            { "fg", "sp" },
            { "DiagnosticHint", "LspDiagnosticsDefaultHint", "DiffAdd" },
            "#273faf"
        ),
    },
}]]--


function M:init(options)
    diagnostics_message.super:init(options)
    self.options.colors = vim.tbl_extend("force", diagnostics_message.default.colors, self.options.colors or {})
    self.highlights = { error = "", warn = "", info = "", hint = "" }
    self.highlights.error = modules.highlight.create_component_highlight_group(
        { fg = "DiagnosticError" },
        "diagnostics_message_error",
        self.options
    )
    self.highlights.warn = modules.highlight.create_component_highlight_group(
        { fg = "DiagnosticWarn" },
        "diagnostics_message_warn",
        self.options
    )
    self.highlights.info = modules.highlight.create_component_highlight_group(
        { fg = "DiagnosticInfo" },
        "diagnostics_message_info",
        self.options
    )
    self.highlights.hint = modules.highlight.create_component_highlight_group(
        { fg = "DiagnosticHint" },
        "diagnostics_message_hint",
        self.options
    )
end

function diagnostics_message:update_status(is_focused)
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    local diagnostics = vim.diagnostic.get(0, { lnum = r - 1 })
    if #diagnostics > 0 then
        local diag = diagnostics[1]
        for _, d in ipairs(diagnostics) do
            if d.severity < diag.severity then
                diagnostics = d
            end
        end
        local icons = { " ", " ", " ", " " }
        local hl = { self.highlights.error, self.highlights.warn, self.highlights.info, self.highlights.hint }
        return modules.highlight.component_format_highlight(hl[diag.severity]) ..
            icons[diag.severity] .. " " .. diag.message
    else
        return ""
    end
end

return diagnostics_message
