local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("GeistMono Nerd Font")
config.color_scheme = "Bitmute"

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
