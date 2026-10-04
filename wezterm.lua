local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"Maple Mono NF",
	"Jetbrains Mono",
})
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.use_resize_increments = true

config.window_frame = {
	font = wezterm.font({ family = "Maple Mono NF", weight = "Bold" }),
	font_size = 12.0,

	active_titlebar_bg = "#11111b",
	inactive_titlebar_bg = "#11111b",
}

config.show_tab_index_in_tab_bar = false

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#11111b",
		new_tab = {
			bg_color = "#11111b",
			fg_color = "#9399b2",
		},
		new_tab_hover = {
			bg_color = "#fab387",
			fg_color = "#11111b",
		},
		active_tab = {
			bg_color = "#181825",
			fg_color = "#89b4fa",
		},
		inactive_tab = {
			bg_color = "#11111b",
			fg_color = "#9399b2",
		},
		inactive_tab_hover = {
			bg_color = "#181825",
			fg_color = "#89b4fa",
		},
	},
}

config.window_decorations = "NONE" -- INTEGRATED_BUTTONS"

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
}

config.enable_wayland = true
config.use_resize_increments = true

config.audible_bell = "Disabled"
config.warn_about_missing_glyphs = false

-- Laptop
if wezterm.hostname() == "harbour" then
	config.font_size = 14
end

return config
