SwitchToWezTerm()
{
  windowHandleId := WinExist("ahk_exe wezterm-gui.exe")
  windowExistsAlready := windowHandleId > 0

  ; If WezTerm is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true)
  {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive)
    {
      ; Minimize the window.
      WinMinimize, "ahk_id %windowHandleId%"
    }
    else
    {
      ; Put the window in focus.
      WinActivate, "ahk_id %windowHandleId%"
      WinShow, "ahk_id %windowHandleId%"
    }
  }
  ; Else it's not already open, so launch it.
  else
  {
    Run, "wezterm"
  }
}

; Hotkey to use F12 to launch/restore WezTerm.
F12::SwitchToWezTerm()
