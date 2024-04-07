local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("GeistMono Nerd Font")
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
