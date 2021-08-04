#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

!1::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\RCAD_ASCO_20200818.ini"
  filePath := A_ScriptDir . "\1FGB B3a.ASCO"

  logInASCO(iniPath)
  openASCO(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\RCAD_ASCO_20200818.ini"
  filePath := A_ScriptDir . "\1FGB B3a right.ASCO"

  logInASCO(iniPath)
  openASCO(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  ; 測試用
  Sleep, 2000
  Send, !c
Return

!r::Reload
; !x::ExitApp

!q::
  restartProgram()
Return

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return
