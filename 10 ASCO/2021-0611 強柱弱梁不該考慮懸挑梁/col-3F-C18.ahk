#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force
#Include %A_ScriptDir%\Lib\

!1::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\col-3F-C18.ini"
  columnCoordinate := {x: 850 / (A_ScreenDPI / 96), y: 460 / (A_ScreenDPI / 96)}

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 5000
  designSingleColumn(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!r::Reload
; !x::ExitApp

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return

!z::
  restartProgram()
Return

!+z::
  restartProductionProgram("C:\Program Files\RCAD\RCAD_ASCO\bin", "RCAD_ASCO")
Return

!c::
  completeDesignColumn()
Return
