local wezterm = require("wezterm")
local config = {}

-- Font settings
config.font = wezterm.font("GeistMono Nerd Font")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14.0
config.color_scheme = "Bitmute"

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
