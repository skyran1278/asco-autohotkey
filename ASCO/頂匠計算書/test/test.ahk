#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force
#Include %A_ScriptDir%\Lib\

!1::
  ; 測試 2F 柱 柱底無梁 Mpr Vp 的計算
  #Include %A_ScriptDir%\col-2F-C119.ahk
Return

!2::
  #Include %A_ScriptDir%\col-10F-C5.ahk
Return

!3::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_WorkingDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  columnCoordinate := {x: 530, y: 380}

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 2000
  designSingleColumn(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!4::
  ; 測試雙翼版
  startTime := A_TickCount

  filePath := A_ScriptDir . "\02 topTech\2020-0719\3F-C7.ASCO"
  iniPath := A_ScriptDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  columnCoordinate := {x: 630, y: 290}

  logInASCO(iniPath)
  openASCO(filePath)
  Sleep, 1000
  designSingleColumn(columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!6::
  startTime := A_TickCount

  filePath := A_ScriptDir . "\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\01 Justin\RCAD_ASCO.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  activate("RCAD_ASCO")
  Send, !c
  Send, {Down 7}
  Send, {Enter}

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {Enter}
  Send, {Right}
  Send, {Enter}

  showExecutionTime(startTime, A_TickCount)
Return

!7::
  startTime := A_TickCount

  filePath := A_ScriptDir . "\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  activate("RCAD_ASCO")
  Send, !c
  Send, {Down 7}
  Send, {Enter}

  ; activate("RCAD_ASCO")
  ; Click, 400, 170, 2 ; Column-2
  ; Click, 470, 600 ; 滾輪條
  ; Click, 300, 440, 2 ; Format_T
  ; Send, {F9}
  ; Sleep, 1000

  ; activate("RCAD_ASCO")
  ; Send, {Enter}
  ; Send, {Right}
  ; Send, {Enter}

  showExecutionTime(startTime, A_TickCount)
Return

!r::Reload
; !x::ExitApp

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return

!q::
  restartProgram()
Return

!t::
  ; 測試用
  Sleep, 2000
  Send, !c
Return
