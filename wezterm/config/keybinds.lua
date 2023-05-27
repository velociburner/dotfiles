local wezterm = require('wezterm')
local act = wezterm.action

return {
  -- Tab bar
  {
    key = 't',
    mods = 'LEADER',
    action = act.EmitEvent('ToggleTabBar')
  },
  {
    key = 't',
    mods = 'ALT',
    action = act.ShowTabNavigator
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = act.ShowLauncher
  },
  {
    key = '[',
    mods = 'LEADER',
    action = act.ActivateCopyMode
  },
  -- Panes
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection('Left')
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection('Down')
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection('Up')
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection('Right')
  },
  {
    key = '\\',
    mods = 'LEADER',
    action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' })
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical({ domain = 'CurrentPaneDomain' })
  }
}
