local wezterm = require("wezterm")
local act = wezterm.action
-- local colors = require('lua/rose-pine').colors()
-- local window_frame = require('lua/rose-pine').window_frame()
local mux = wezterm.mux

return {
	-- Sart tab bar [distraction-free mode]
	hide_tab_bar_if_only_one_tab = true,

	-- Color scheme
	-- https://wezfurlong.org/wezterm/config/appearance.html
	color_scheme = "kanagawabones",
	-- colors = colors,
	-- window_frame = window_frame, -- needed only if using fancy tab bar

	window_background_opacity = 0.90,

	-- Font configuration
	-- https://wezfurlong.org/wezterm/config/fonts.html
	font = wezterm.font("Iosevka Term"),
	font_size = 11.0,

	-- Disable ligatures
	-- https://wezfurlong.org/wezterm/config/font-shaping.html
	--  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

	-- Cursor style
	default_cursor_style = "BlinkingBlock",

	keys = {
		-- search for things that look like git hashes
		{
			key = "H",
			mods = "SHIFT|CTRL",
			action = act.Search({
				Regex = "[a-f0-9]{6,}",
			}),
		},
		-- search for the lowercase string "hash" matching the case exactly
		{
			key = "H",
			mods = "SHIFT|CTRL",
			action = act.Search({ CaseSensitiveString = "hash" }),
		},
		-- search for the string "hash" matching regardless of case
		{
			key = "H",
			mods = "SHIFT|CTRL",
			action = act.Search({ CaseInSensitiveString = "hash" }),
		},
	},

	wezterm.on("gui-startup", function()
		local tab, pane, window = mux.spawn_window({})
		window:gui_window():maximize()
	end),
}
