local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
    'Maple Mono NF',
    'Jetbrains Mono',
}
config.color_scheme = 'Catppuccin Mocha'
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action({ PasteFrom = "Clipboard" }),
    },
}

config.audible_bell = "Disabled"

return config
