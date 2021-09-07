#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

env := "production"

!1::
  ; 018 支柱
  startTime := A_TickCount

  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\RCAD_ASCO.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  ; 132 支柱
  startTime := A_TickCount

  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!3::
  ; 240 支柱
  startTime := A_TickCount

  filePath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!4::
  ; 455 支柱
  startTime := A_TickCount

  filePath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ASCO"
  iniPath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  ControlClick, 是(&Y), ahk_exe RCAD_ASCO.exe
  startDialog()
  waitForDesign()
  exitDialog()
  ; ControlGetText, OutputVar , Button2, ahk_exe RCAD_ASCO.exe
  ; MsgBox, Control with focus = %exitOrAbort%
  ; ControlGet, OutputVar, List, Focused,,ahk_exe RCAD_ASCO.exe
  ; ControlGetFocus, OutputVar, Untitled - Notepad
  ; if ErrorLevel
  ; MsgBox, The target window doesn't exist or none of its controls has input focus.
  ; else
  ; MsgBox, Control with focus = %OutputVar%
  ; ControlSend, Button2, {Enter}, ahk_exe RCAD_ASCO.exe
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
