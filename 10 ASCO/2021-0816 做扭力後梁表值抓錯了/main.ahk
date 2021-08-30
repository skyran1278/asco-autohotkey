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

  filePath := A_WorkingDir . "\3F G3.ASCO"
  iniPath := A_WorkingDir . "\3F G3.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 1300, y: 750}
  }
  ; If (A_ScreenDPI = 120) {
  ;   columnCoordinate := {x: 1220, y: 510}
  ; }
  If (A_ScreenDPI = 144) {
    columnCoordinate := {x: 2300, y: 1600}
  }

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 2000
  ; designSingleBeamByDraw(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_ASCO\DockingPaneLayouts
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
