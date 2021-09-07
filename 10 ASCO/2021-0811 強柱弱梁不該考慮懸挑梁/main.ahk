#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

env := "production"

!1::
  ; 強柱弱梁不該考慮懸挑梁

  startTime := A_TickCount

  filePath := A_WorkingDir . "\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\col-3F-C18.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 850, y: 460}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 850, y: 460}
  }

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 3000
  If (env != "production") {
    Sleep, 2000
  }
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  ; 13F-C11
  ; 有考慮 Vp 但中段控制載重為零
  ; 因為 Vs = Ve / fai - Vc 扣掉 Vc 後小於零

  startTime := A_TickCount

  filePath := A_WorkingDir . "\col-13F-C11.ASCO"
  iniPath := A_WorkingDir . "\col-13F-C11.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 570, y: 380}
  }
  ; If (A_ScreenDPI = 120) {
  ;   columnCoordinate := {x: 750, y: 460}
  ; }

  logInASCO(iniPath)
  openASCO(filePath)

  Sleep, 3000
  If (env != "production") {
    Sleep, 2000
  }
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!6::
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
