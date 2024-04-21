local wezterm = require("wezterm")
local config = {}

-- Font settings
config.font = wezterm.font("Go Mono")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14.0

-- Window settings
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 0,
}

-- Color scheme (default is light theme)
config.color_scheme = "neobones_light"

-- Event handler for toggling the colorscheme between light and dark
wezterm.on("toggle-colorscheme", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		-- Override the color scheme with Bitmute (dark theme)
		overrides.color_scheme = "neobones_dark"
	else
		overrides.color_scheme = nil
	end
	window:set_config_overrides(overrides)
end)

-- Key bindings
config.keys = {
	{ -- Reload the configuration
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	{ -- Toggle the colorscheme
		key = "E",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-colorscheme"),
	},
	{ -- Ctrl + Backspace to delete words
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
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
