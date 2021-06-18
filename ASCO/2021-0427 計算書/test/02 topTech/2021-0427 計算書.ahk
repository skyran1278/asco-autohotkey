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

open(ini_path, file_path) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activate()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%ini_path%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
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
  ; Click, 360, 70 ; OK
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  ; Click, Right, 1643, 500 ; 右鍵 檔名
  ; Click, 1700, 580 ; 單柱設計
  Click, Right, 530, 270 ; 右鍵 檔名
  Click, 630, 360 ; 單柱設計
  Sleep, 1000

  activate()
  ; Click, 400, 110, 2 ; RCAD 內力配筋
  ; Click, 400, 640, 2 ; Format_T
  ; Click, 360, 70 ; OK
  Click, 400, 130, 2 ; RCAD 內力配筋
  Click, 400, 170, 2 ; Column-2
  Click, 400, 800, 2 ; Format_T
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}

!a::
  start_time := A_TickCount

  ini_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\2021-0611 09351-GIRDER&COL2_test2.ASCO"
  open(ini_path, file_path)

  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

!r::Reload
; !x::ExitApp

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return

!t::
  start_time := A_TickCount

  s := ""
  ; Simple substitution
  s .= Format("{2}, {1}!`r`n", "World", "Hello")
  ; Padding with spaces
  s .= Format("|{:-10}|`r`n|{:10}|`r`n", "Left", "Right")
  ; Hexadecimal
  s .= Format("{1:#x} {2:X} 0x{3:x}`r`n", 3735928559, 195948557, 0)
  ; Floating-point
  s .= Format("{1:0.3f} {1:.10f}", 4*ATan(1))

  ListVars ; Use AutoHotkey's main window to display monospaced text.
  WinWaitActive ahk_class AutoHotkey
  ControlSetText Edit1, %s%
  WinWaitClose
  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return
