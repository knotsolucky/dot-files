local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.keys = {
  { key = 'f', mods = 'CTRL|CMD', action = wezterm.action.ToggleFullScreen },
}

config = {
  font_size = 19,
  font = wezterm.font("JetBrains Mono",{weight = "Bold"}),
  automatically_reload_config = true;
  enable_tab_bar = false;
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
  window_background_opacity = 0.1,
  macos_window_background_blur = 10,
  color_scheme = "tokyonight_night",
  native_macos_fullscreen_mode = true,
}

return config
