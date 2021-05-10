#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

activate() {
  if WinExist("ahk_exe RCAD_ASCO.exe") {
    WinActivate ; Use the window found by WinExist.
    return true
  }
  return false
}

open(file_path) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000
  activate()
  Send, {Enter}
  Sleep, 4000

  if (!activate())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%file_path%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  if (!activate())
    return
  Click, 360, 70 ; OK
  Sleep, 1000

  activate()
  Click, Right, 1643, 500 ; 右鍵 檔名
  Click, 1700, 580 ; 單柱設計
  Sleep, 1000

  activate()
  Click, 400, 110, 2 ; RCAD 內力配筋
  Click, 400, 640, 2 ; Format_T
  Click, 360, 70 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
  ; Click, 400, 110 ; 匯入 excel
  ; Click, 400, 110 ; read

  ; Send, {Blind}{Text}%excel_path%
  ; Send, {Enter}
  ; Send, {Enter}
  ; Sleep, 2000

  ; activate()
  ; Click, 450, 60 ; exit
  ; Sleep, 1000

  ; activate()
  ; Click, 400, 150 ; 匯入結構平面圖

  ; Send, {Blind}{Text}%dwg_path%
  ; Send, {Enter}
  ; Send, {Enter}
  ; Sleep, 1000
}

!z::
  start_time := A_TickCount

  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\2021-0506 計算書.ASCO"
  open(file_path)

  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % elapsed_time . "s"
Return

!r::Reload
!x::ExitApp

!a::
  if WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return
