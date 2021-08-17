#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

env := "production"

!1::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\col-B1F-C34.ASCO"
  iniPath := A_WorkingDir . "\col-B1F-C34.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 1200, y: 450}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 1200, y: 450}
  }

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 3000
  designSingleColumnByDraw(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_ASCO\DockingPaneLayouts
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
