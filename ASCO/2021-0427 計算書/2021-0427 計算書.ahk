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
  ; Click, 360, 70 ; OK
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  ; Click, Right, 1643, 500 ; 右鍵 檔名
  ; Click, 1700, 580 ; 單柱設計
  Click, Right, 1625, 500 ; 右鍵 檔名
  Click, 1700, 590 ; 單柱設計
  Sleep, 1000

  activate()
  ; Click, 400, 110, 2 ; RCAD 內力配筋
  ; Click, 400, 640, 2 ; Format_T
  ; Click, 360, 70 ; OK
  Click, 400, 130, 2 ; RCAD 內力配筋
  Click, 400, 800, 2 ; Format_T
  Click, 360, 80 ; OK
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

!a::
  start_time := A_TickCount

  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\2021-0529 計算書.ASCO"
  open(file_path)

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
