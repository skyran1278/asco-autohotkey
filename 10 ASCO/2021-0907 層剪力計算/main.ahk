#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

; https://www.autohotkey.com/docs/Functions.htm#lib

; 這個檔案比較特別，剛好本 repo clone 的位置可以直接用 %Documents%\autohotkey\Lib 的內容
; 僅為了方便快速迭代開發用
; 比較完整的做法是把 %Documents%\autohotkey\Lib 的內容 copy 過來

global env := "dev"

!1::
  startTime := A_TickCount

  ; 455 支柱
  filePath := A_WorkingDir . "\2021-0907 層剪力計算.ASCO"
  iniPath := A_WorkingDir . "\2021-0907 層剪力計算.ini"
  logInASCO(iniPath)
  openASCO(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!t::

Return

!q::
  restartASCO()
Return

!w::
  closeProgram("notepad")
Return

!e::ExitApp
!r::Reload
