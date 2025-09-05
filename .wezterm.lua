local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 18
config.font = wezterm.font("JetBrainsMono NF")
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"

-- Padding
config.window_padding = {
	left = 0,
	right = 0,
	bottom = 0,
	top = 0,
}

config.line_height = 1.2

config.max_fps = 120
config.prefer_egl = true
config.native_macos_fullscreen_mode = true
config.initial_cols = 200
config.initial_rows = 50

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

return config
