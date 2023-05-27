local wezterm = require('wezterm')
local keybinds = require('config.keybinds')

local config = {}

-- Setup
if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_domain = 'WSL:Ubuntu'
end

-- Appearance
config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.font = wezterm.font('Fira Code')
config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}

-- Tab bar
config.enable_tab_bar = false

local function toggle_tab_bar(window)
  local current_config = window:get_config_overrides() or {}
  local new_config = {
    enable_tab_bar = not (current_config.enable_tab_bar or false)
  }
  window:set_config_overrides(new_config)
end

wezterm.on('ToggleTabBar', toggle_tab_bar)

-- Keybinds
config.leader = { key = 'Space', mods = 'ALT' }
config.keys = keybinds

return config
