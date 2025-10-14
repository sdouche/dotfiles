local wezterm = require("wezterm")
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.default_cursor_style = 'BlinkingBar'
config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", scale = 1.4 },
  { family = "Ubuntu Mono",  scale = 1.4 },
  { family = "FiraCode",  scale = 1.4 },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "default"

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- Keys
config.leader = { key = "z", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
  -- Send C-a when pressing C-a twice
  { key = "z", mods = "LEADER",           action = act.SendKey { key = "a", mods = "ALT" } },
  { key = "c", mods = "LEADER",           action = act.ActivateCopyMode },

  -- Pane keybindings
  { key = "f", mods = "LEADER",           action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  -- SHIFT is for when caps lock is on
  { key = "d", mods = "LEADER",           action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "LeftArrow", mods = "LEADER",   action = act.ActivatePaneDirection("Left") },
  { key = "DownArrow", mods = "LEADER",   action = act.ActivatePaneDirection("Down") },
  { key = "UpArrow", mods = "LEADER",     action = act.ActivatePaneDirection("Up") },
  { key = "RightArrow", mods = "LEADER",  action = act.ActivatePaneDirection("Right") },
  { key = "x", mods = "LEADER",           action = act.CloseCurrentPane { confirm = true } },
  { key = "z", mods = "LEADER",           action = act.TogglePaneZoomState },
  { key = "s", mods = "LEADER",           action = act.RotatePanes "Clockwise" },
  -- We can make separate keybindings for resizing panes
  -- But Wezterm offers custom "mode" in the name of "KeyTable"
  { key = "r", mods = "LEADER",           action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

  -- Tab keybindings
  { key = "n", mods = "LEADER",           action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[", mods = "LEADER",           action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER",           action = act.ActivateTabRelative(1) },
  { key = "t", mods = "LEADER",           action = act.ShowTabNavigator },
  -- Key table for moving tabs around
  { key = "m", mods = "LEADER",           action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

  -- Lastly, workspace
  { key = "w", mods = "LEADER",           action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },

}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1)
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
    { key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
    { key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
    { key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  }
}

bar.apply_to_config(config)
workspace_switcher.apply_to_config(config)

return config
