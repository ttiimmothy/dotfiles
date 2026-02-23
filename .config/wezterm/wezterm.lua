-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.initial_cols = 308
config.initial_rows = 88
config.font_size = 10
config.color_scheme = "Raycast_Dark"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 60
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = 'SteadyBar'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
return config