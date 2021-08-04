#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

openFile() {
  if WinExist("ahk_exe RCAD_ASCO.exe") {
    WinActivate ; Use the window found by WinExist.

    ; 登入
    Send, {enter}
    Sleep, 1000
    Send, {enter}
    Sleep, 3000
  }

  if WinExist("ahk_exe RCAD_ASCO.exe") {
    WinActivate ; Use the window found by WinExist.
  } else {
    return
  }

  Send, ^o ; 開啟舊檔
  Sleep, 1000 ; 實測一定要

  Click, 500, 115, 2 ; 開啟
  Sleep, 1000

  Click, 360, 70 ; OK
  Sleep, 2000
}

calculateColumn() {
  if WinExist("ahk_exe RCAD_ASCO.exe") {
    WinActivate ; Use the window found by WinExist.
  } else {
    MsgBox, No calculate column.
    return
  }

  Click, 200, -10 ; RC 柱

  Click, 300, 220 ; 全棟計算

  Click, 360, 70 ; OK
  Sleep, 1000

  Click, 170, 325 ; start
}

!z::
  openFile()
Return

!a::
  calculateColumn()
Return

!x::
  openFile()
  calculateColumn()
Return
