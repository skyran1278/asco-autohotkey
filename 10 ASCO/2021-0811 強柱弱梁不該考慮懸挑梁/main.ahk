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

  filePath := A_WorkingDir . "\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\col-3F-C18.ini"
  columnCoordinate := {x: 850, y: 460}

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 2000
  If (env != "production") {
    Sleep, 3000
  }
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\col-3F-C18.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_ASCO\DockingPaneLayouts
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
