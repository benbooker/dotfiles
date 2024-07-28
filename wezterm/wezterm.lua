-- WezTerm Config :)

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Set color scheme
config.color_scheme = "Brogrammer"

-- Set the font configuration
config.font = wezterm.font_with_fallback({
	{ family = "MesloLGS Nerd Font Mono", weight = "Regular", italic = false },
	"JetBrains Mono", -- fallback fonts
	"Noto Color Emoji",
})
config.font_size = 14.0

-- Other config options
config.hide_tab_bar_if_only_one_tab = true

-- Return the configuration to wezterm
return config
