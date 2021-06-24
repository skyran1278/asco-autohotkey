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

testJustin(ini_path, file_path) {
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
  Click, Right, 1625, 500 ; 右鍵 檔名
  Click, 1700, 590 ; 單柱設計
  Sleep, 1000

  activate()
  ; Click, 400, 110, 2 ; RCAD 內力配筋
  ; Click, 400, 640, 2 ; Format_T
  ; Click, 360, 70 ; OK
  Click, 400, 130, 2 ; RCAD 內力配筋
  Click, 400, 835 ; Format_T
  Click, 400, 800, 2 ; Format_T
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}

testTopTech(ini_path, file_path, columnCoordinate) {
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
  ; Click, Right, 530, 270 ; 右鍵 檔名
  ; Click, 630, 360 ; 單柱設計
  MouseClick, Right, % columnCoordinate.x, % columnCoordinate.y
  MouseClick, , % columnCoordinate.x + 100, % columnCoordinate.y + 90
  ; Click, Right, %x%, %y% ; 右鍵 檔名
  ; Click, %x+100%, %y+90% ; 單柱設計
  Sleep, 1000

  activate()
  ; Click, 400, 110, 2 ; RCAD 內力配筋
  ; Click, 400, 640, 2 ; Format_T
  ; Click, 360, 70 ; OK
  Click, 400, 130, 2 ; RCAD 內力配筋
  Click, 400, 170, 2 ; Column-2
  Click, 400, 835 ; Format_T
  Click, 400, 800, 2 ; Format_T
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}

!1::
  start_time := A_TickCount

  ini_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\01 Justin\RCAD_ASCO.ini"
  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\01 Justin\2021-0602 計算書.ASCO"
  testJustin(ini_path, file_path)

  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

!2::
  start_time := A_TickCount

  ini_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\2021-0611 10F-C5.ASCO"
  columnCoordinate := {x: 530, y: 270}
  testTopTech(ini_path, file_path, columnCoordinate)

  elapsed_time := (A_TickCount - start_time) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

!3::
  start_time := A_TickCount

  ini_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  file_path := "D:\GitHub\autohotkey\ASCO\2021-0427 計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  columnCoordinate := {x: 530, y: 370}
  testTopTech(ini_path, file_path, columnCoordinate)

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
