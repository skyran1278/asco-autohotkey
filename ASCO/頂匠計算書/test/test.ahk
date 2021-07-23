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

testJustin(iniPath, filePath) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activate()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%iniPath%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
  Sleep, 4000

  if (!activate())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
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

testJustinAllColumn(iniPath, filePath) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activate()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%iniPath%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
  Sleep, 4000

  if (!activate())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  if (!activate())
    return
  ; Click, 360, 70 ; OK
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, !c
  Send, {Down 7}
  Send, {Enter}

  activate()
  ; ; Click, 400, 110, 2 ; RCAD 內力配筋
  Click, 300, 700, 2 ; Format_T
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}

testTopTech(iniPath, filePath, columnCoordinate) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activate()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%iniPath%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
  Sleep, 4000

  if (!activate())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
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

testTopTechAllColumn(iniPath, filePath) {
  if (!activate())
    return
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activate()
  Click, 200, 200 ; ini
  Sleep, 1000

  Send, {Blind}{Text}%iniPath%
  Send, {Enter}
  Sleep, 1000

  Click, 700, 60 ; ok
  Sleep, 4000

  if (!activate())
    return
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  if (!activate())
    return
  ; Click, 360, 70 ; OK
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, !c
  Send, {Down 7}
  Send, {Enter}

  activate()
  Click, 400, 170, 2 ; Column-2
  Click, 470, 600 ; 滾輪條
  Click, 300, 440, 2 ; Format_T
  Click, 360, 80 ; OK
  Sleep, 1000

  activate()
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}

showExecutionTime(startTime, endTime) {
  elapsedTime := (endTime - startTime) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsedTime)
}

!1::
  ; 測試 2F 柱 柱底無梁 Mpr Vp 的計算
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\01 Justin\RCAD_ASCO.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  testJustin(iniPath, filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\2021-0611 10F-C5.ASCO"
  columnCoordinate := {x: 530, y: 270}
  testTopTech(iniPath, filePath, columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!3::
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  columnCoordinate := {x: 530, y: 370}
  testTopTech(iniPath, filePath, columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
Return

!4::
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\01 Justin\RCAD_ASCO.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  testJustinAllColumn(iniPath, filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!5::
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  testTopTechAllColumn(iniPath, filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!6::
  ; 測試雙翼版
  startTime := A_TickCount

  iniPath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  filePath := "D:\GitHub\autohotkey\ASCO\頂匠計算書\test\02 topTech\2020-0719\3F-C7.ASCO"
  columnCoordinate := {x: 630, y: 280}
  testTopTech(iniPath, filePath, columnCoordinate)

  showExecutionTime(startTime, A_TickCount)
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
