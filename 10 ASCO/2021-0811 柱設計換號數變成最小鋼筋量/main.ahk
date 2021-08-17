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

  filePath := A_WorkingDir . "\col-2F-C15.ASCO"
  iniPath := A_WorkingDir . "\col-2F-C15.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 1280, y: 710}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 850, y: 460}
  }

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 1000
  If (env != "production") {
    Sleep, 4000
  }

  designSingleColumnByDraw(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  MsgBox, % A_ScreenDPI
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
