#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force
SetControlDelay 0 ; https://www.autohotkey.com/docs/commands/SetControlDelay.htm

; https://www.autohotkey.com/docs/Functions.htm#lib

; 這個檔案比較特別，剛好本 repo clone 的位置可以直接用 %Documents%\autohotkey\Lib 的內容
; 僅為了方便快速迭代開發用
; 比較完整的做法是把 %Documents%\autohotkey\Lib 的內容 copy 過來

global env := "production"

!1::
  startTime := A_TickCount

  ; 018 支柱
  restartASCO()
  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\RCAD_ASCO.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllColumn()
  redesignTie()
  outputDrawColumn()

  ; 132 支柱
  restartASCO()
  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllColumn()
  redesignTie()
  outputDrawColumn()

  ; 240 支柱
  restartASCO()
  filePath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllColumn()
  redesignTie()
  outputDrawColumn()

  ; 455 支柱
  restartASCO()
  filePath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ASCO"
  iniPath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllColumn()
  redesignTie()
  outputDrawColumn()

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  restartASCO()
  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\2021-0714 計算書.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\01 Justin\RCAD_ASCO.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllBeam()
  outputDrawBeam()

  restartASCO()
  filePath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\2021-0618 4F-C12.ASCO"
  iniPath := A_ScriptDir . "\2021-0427 頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllBeam()
  outputDrawBeam()

  restartASCO()
  filePath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ASCO"
  iniPath := A_WorkingDir . "\2021-0811 強柱弱梁不該考慮懸挑梁\col-3F-C18.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllBeam()
  outputDrawBeam()

  restartASCO()
  filePath := A_WorkingDir . "\2021-1020 梁表 Avt 沒出來\2021-1020 梁表 Avt 沒出來.ASCO"
  iniPath := A_WorkingDir . "\2021-1020 梁表 Avt 沒出來\2021-1020 梁表 Avt 沒出來.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  designAllBeam()
  outputDrawBeam()

  showExecutionTime(startTime, A_TickCount)
Return

!t::
  startTime := A_TickCount

  restartASCO()
  filePath := A_WorkingDir . "\2021-1020 梁表 Avt 沒出來\2021-1020 梁表 Avt 沒出來.ASCO"
  iniPath := A_WorkingDir . "\2021-1020 梁表 Avt 沒出來\2021-1020 梁表 Avt 沒出來.ini"
  logInASCO(iniPath)
  openASCO(filePath)
  ; designAllBeam()
  ; outputDrawBeam()

  ; redesignTie()
  ; outputDrawColumn()
  ; designAllColumn()
  ; redesignTie()
  ; outputDrawColumn()
  ; restartASCO()

  ; iniPath := A_WorkingDir . "\2021-0427 頂匠計算書\test\02 topTech\RCAD_ASCO_20210610_for Review.ini"
  ; filePath := A_WorkingDir . "\2021-0427 頂匠計算書\test\02 topTech\2021-0611 10F-C5.ASCO"
  ; If (A_ScreenDPI = 96) {
  ;   columnCoordinate := {x: 530, y: 280}
  ; }
  ; If (A_ScreenDPI = 120) {
  ;   columnCoordinate := {x: 530, y: 280}
  ; }
  ; logInASCO(iniPath)
  ; openASCO(filePath)
  ; Sleep, 2000
  ; designSingleColumnByGeometry(columnCoordinate)
  ; WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC柱(C), R2 更改配筋-1

  ; exitOrAbort := ""
  ; times1 := 0
  ; While, exitOrAbort != "exit" {
  ;   ; 出現意外狀況
  ;   If (exitOrAbort = "確定") {
  ;     Send, {Enter}
  ;   }
  ;   ControlGetText, exitOrAbort , "5.1Write", ahk_exe RCAD_ASCO.exe
  ;   times1 += 1
  ;   If (times1 > 1000) {
  ;     Break
  ;   }
  ; }

  ; times1 := 0
  ; available1 := 0
  ; While (available1 != 1) {
  ;   ControlGet, available1, Visible, , % "5.1Write", % "ahk_exe " . "RCAD_ASCO" . ".exe"
  ;   Sleep, 10
  ;   times1 += 1

  ;   If (times1 > 1000) {
  ;     Break
  ;   }
  ; }

  ; WinWait , % "ahk_exe " . programName . ".exe", % buttonName, 10
  ; clickButton("確定", "RCAD_ASCO")
  ; WinWait, % "ahk_exe " . "RCAD_ASCO" . ".exe", % "5.1Write", 10
  ; ControlClick , % "確定", % "ahk_exe " . "RCAD_ASCO" . ".exe",,,, NA
  ; MsgBox, % times1
  ; Send, {F2}
  showExecutionTime(startTime, A_TickCount)
  ; redesignTie()
  ; outputDrawColumn()

  ; activateOrExit("RCAD_ASCO")
  ; WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC柱(C), R2 更改配筋-1
  ; clickButton("2.12重算繫筋-ALL", "RCAD_ASCO")

  ; ; Sleep, 2000
  ; ; num := 0
  ; available := False
  ; While (available = False) {
  ;   ControlGet, available, Enabled, , 2.12重算繫筋-ALL, ahk_exe RCAD_ASCO.exe
  ;   ; Sleep, 10
  ;   ; num += 1
  ; }
  ; ; MsgBox, % num

  ; ControlClick , 2.12重算繫筋-ALL, ahk_exe RCAD_ASCO.exe,,,, NA

  ; filePath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ASCO"
  ; iniPath := A_WorkingDir . "\2021-0907 層剪力計算\2021-0907 層剪力計算.ini"
  ; logInASCO(iniPath)
  ; openASCO(filePath)
  ; designAllColumn()
Return

!q::
  restartASCO()
Return

!w::
  closeApp("notepad")
Return

!e::ExitApp
!r::Reload
