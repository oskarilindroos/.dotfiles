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
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Key bindings
config.keys = {
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

-- Mouse bindings
config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- and make CTRL-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
