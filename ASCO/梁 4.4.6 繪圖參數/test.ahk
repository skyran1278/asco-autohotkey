#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

activateASCO() {
  if WinExist("ahk_exe RCAD_ASCO.exe") {
    WinActivate ; Use the window found by WinExist.
    return true
  }
  return false
}

testOpenFile(ini_path, file_path) {
  if (!activateASCO())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activateASCO()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%ini_path%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
  Sleep, 4000

  if (!activateASCO())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%file_path%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  if (!activateASCO())
    return
  ; Click, 360, 70 ; OK
  Click, 360, 80 ; OK
  Sleep, 1000

}

!1::
  start_time := A_TickCount

  ini_path := "D:\GitHub\autohotkey\ASCO\梁 4.4.6 繪圖參數\RCAD_ASCO_20200818.ini"
  file_path := "D:\GitHub\autohotkey\ASCO\梁 4.4.6 繪圖參數\1FGB B3a.ASCO"
  testOpenFile(ini_path, file_path)

  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

!t::
  ; 測試用
  Sleep, 2000
  Send, !c
Return

!r::Reload
; !x::ExitApp

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return
