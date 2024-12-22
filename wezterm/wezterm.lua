local wezterm = require("wezterm")
local config = wezterm.config_builder()

config = {
  font_size = 19,
  font = wezterm.font("JetBrainsMono NF"),
  automatically_reload_config = true;
  enable_tab_bar = false;
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  default_cursor_style = "BlinkingBar",
  window_background_opacity = 0.1,
  macos_window_background_blur = 10,
}

return config
