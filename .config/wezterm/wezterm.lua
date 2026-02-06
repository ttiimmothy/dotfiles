-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 306
config.initial_rows = 87

-- or, changing the font size and color scheme.
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

-- Finally, return the configuration to wezterm:
return config