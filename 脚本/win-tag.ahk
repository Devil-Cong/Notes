#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

TaggleActivateWin()
{
  WinGet, Active_ID, ID, A
  WinGet, Active_Process, ProcessPath, ahk_id %Active_ID%
  ; MsgBox, %Active_Process%
  WinGet, Arr, List, ahk_exe %Active_Process%
  Next_Index = %Arr%
  Element := Arr%Next_Index%
  WinActivate, ahk_id %Element%
  return
}

ToggleWin(p)
{
  if WinActive("ahk_exe " . p)
  {
    WinMinimize
    return
  }

  if WinExist("ahk_exe " . p)
  {
    WinShow
    WinActivate
    return
  }
}

!g::ToggleWin("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
!s::ToggleWin("D:\Sublime Text 3\sublime_text.exe")
!w::ToggleWin("D:\WeChat\WeChat.exe")
!c::ToggleWin("D:\Cmder\vendor\conemu-maximus5\ConEmu64.exe")
!h::ToggleWin("D:\BaiduHi2.0\Hi.exe")

!t::
WinGet, Active_ID, ID, A
WinGet, Active_Process, ProcessPath, ahk_id %Active_ID%
MsgBox, %Active_Process%
return

!n::TaggleActivateWin()