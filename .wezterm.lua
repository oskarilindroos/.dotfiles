local wezterm = require("wezterm")
local config = {}

-- Font settings
config.font = wezterm.font("GoMono Nerd Font")
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_size = 14.0

-- Fix for Hyprland
config.enable_wayland = false

-- Window settings
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE" -- Only show the resize handle
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Color scheme (default)
config.color_scheme = "neobones_light"

-- Event handler for toggling the colorscheme between light and dark
wezterm.on("toggle-colorscheme", function(window, _)
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
		key = "R",
		mods = "CTRL",
		action = wezterm.action.ReloadConfiguration,
	},
	{ -- Toggle the colorscheme
		key = "B",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-colorscheme"),
	},
	{ -- Ctrl + Backspace to delete words
		key = "Backspace",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = "w", mods = "CTRL" }),
	},
	{ -- Toggle fullscreen
		key = "F",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
