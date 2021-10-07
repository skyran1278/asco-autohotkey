#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

global env := "dev"

!1::
  restartRB()

  startTime := A_TickCount

  iniPath := A_ScriptDir . "\2021-1001 右鍵閃退.ini"
  filePath := A_ScriptDir . "\2021-1001 右鍵閃退.rb"

  logInRB(iniPath)
  openRBFile(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  WinGetText, output, % "ahk_exe " . "RCAD_Building" . ".exe"
  msgbox The text in the window is:`n%output%
Return

!q::
  restartRB()
Return

!w::
  closeApp("notepad")
Return

!e::ExitApp
!r::Reload
