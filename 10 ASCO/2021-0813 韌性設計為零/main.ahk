#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

env := "dev"

!1::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\2021-0813 韌性設計為零.ASCO"
  iniPath := A_WorkingDir . "\2021-0813 韌性設計為零.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 1220, y: 510}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 1220, y: 510}
  }

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 1000
  If (env != "production") {
    Sleep, 2000
  }
  ; designSingleColumnByDraw(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_ASCO\DockingPaneLayouts
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
