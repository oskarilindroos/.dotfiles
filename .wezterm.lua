local wezterm = require("wezterm")
local config = {}

-- Font settings
config.font = wezterm.font("GeistMono Nerd Font")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14.0

-- Color scheme
config.color_scheme = "Bitmute"
-- config.color_scheme = "Alabaster"

-- Window settings
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 30,
	right = 30,
	top = 20,
	bottom = 10,
}

config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
