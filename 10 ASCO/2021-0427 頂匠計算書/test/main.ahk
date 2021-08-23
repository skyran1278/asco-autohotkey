#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

env := "production"

!1::
  ; 測試 2F 柱 柱底無梁 Mpr Vp 的計算
  startTime := A_TickCount

  iniPath := A_WorkingDir . "\01 Justin\RCAD_ASCO.ini"
  filePath := A_WorkingDir . "\01 Justin\2021-0714 計算書.ASCO"

  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 1700, y: 500}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 1657, y: 487}
  }

  logInASCO(iniPath)
  openASCO(filePath)
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  iniPath := A_WorkingDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  filePath := A_WorkingDir . "\02 topTech\2021-0611 10F-C5.ASCO"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 530, y: 280}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 530, y: 280}
  }

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 2000
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!3::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_WorkingDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 530, y: 380}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 530, y: 380}
  }

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 2000
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!4::
  ; 測試雙翼版
  startTime := A_TickCount

  filePath := A_ScriptDir . "\02 topTech\2020-0719\3F-C7.ASCO"
  iniPath := A_ScriptDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 630, y: 290}
  }
  If (A_ScreenDPI = 120) {
    columnCoordinate := {x: 630, y: 290}
  }

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 1000
  designSingleColumnByGeometry(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!6::
  startTime := A_TickCount

  filePath := A_ScriptDir . "\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\01 Justin\RCAD_ASCO.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  If (env = "production") {
    Sleep, 1000
    completeDesignColumn()
  }

  showExecutionTime(startTime, A_TickCount)
Return

!7::
  startTime := A_TickCount

  filePath := A_ScriptDir . "\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  If (env = "production") {
    Sleep, 6000
    completeDesignColumn()
  }

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  MsgBox, % A_ScreenDPI
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
