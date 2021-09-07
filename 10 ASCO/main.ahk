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

  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\RCAD_ASCO.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  If (env = "production") {
    Sleep, 2000

    exitDialog()

    startDialog()
    Sleep, 2000

    exitDialog()
  }

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  If (env = "production") {
    Sleep, 6000

    exitDialog()

    startDialog()
    Sleep, 2000

    exitDialog()
  }

  showExecutionTime(startTime, A_TickCount)
Return

!3::
  startTime := A_TickCount

  filePath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ini"

  logInASCO(iniPath)
  openASCO(filePath)

  designAllColumn()

  If (env = "production") {
    Sleep, 7000

    exitDialog()

    startDialog()
    Sleep, 2000

    Send, {Enter}
    Sleep, 1000
    Send, {Enter}
    Sleep, 2000

    exitDialog()
  }

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  MsgBox, % A_ScreenDPI
Return

#Include, %A_ScriptDir%\Lib\ASCOShortcut.ahk
