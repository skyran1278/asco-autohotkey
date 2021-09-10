#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client
#SingleInstance Force

global env := "dev"

!1::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\科建 SRC2.1.ini"
  filePath := A_ScriptDir . "\00 空檔.rb"
  excelPath := A_ScriptDir . "\00 Input\inp-05-科建聯合 SRC 柱配筋 (需微調成 SRC.2.1 格式).xlsx"
  dwgPath := A_ScriptDir . "\00 Input\結構平面圖 (需增加對位點).dwg"

  logInRB(iniPath)
  openRBFile(filePath)

  Sleep, 3000

  If (A_ScreenDPI = 96) {
    columnCoordinate := {x: 200, y: 160}
  }
  activateOrExit("RCAD_Building")
  MouseClick, Right, % columnCoordinate.x, % columnCoordinate.y ; 右鍵 配筋-柱
  Sleep, 1000
  Send, {Down 3}
  Send, {Enter}
  Send, {Down}
  Sleep, 1000
  Send, {Enter}

  Sleep, 3000

  SetControlDelay -1

  ControlClick , 匯入 Excel, ahk_exe RCAD_Building.exe,,,, NA
  Sleep, 1000

  ControlClick , Read, ahk_exe RCAD_Building.exe,,,, NA
  Sleep, 1000

  Send, {Blind}{Text}%excelPath%
  Send, {enter}
  Send, {enter}

  closeApp("notepad")
  WinWaitActive % "ahk_exe " . "notepad" . ".exe",, 20

  activateOrExit("RCAD_Building")
  Send, {F2} ; exit
  Sleep, 1000

  ControlClick , 匯入結構平面圖, ahk_exe RCAD_Building.exe,,,, NA
  Sleep, 1000

  Send, {Blind}{Text}%dwgPath%
  Send, {enter}
  Send, {enter}
  Sleep, 1000

  showExecutionTime(startTime, A_TickCount)
Return

!2::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\科建 SRC2.1.ini"
  filePath := A_ScriptDir . "\02 關閉不需要的圖層 完成.rb"

  logInRB(iniPath)
  openRBFile(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!3::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\科建 SRC2.1.ini"
  filePath := A_ScriptDir . "\03 模型辨識 完成.rb"

  logInRB(iniPath)
  openRBFile(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!4::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\科建 SRC2.1.ini"
  filePath := A_ScriptDir . "\04 梁自動截齊 完成.rb"

  logInRB(iniPath)
  openRBFile(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!5::
  startTime := A_TickCount

  iniPath := A_ScriptDir . "\科建 SRC2.1.ini"
  filePath := A_ScriptDir . "\05 排列鋼筋位置 完成.rb"

  logInRB(iniPath)
  openRBFile(filePath)

  showExecutionTime(startTime, A_TickCount)
Return

!t::

Return

!q::
  restartRB()
Return

!w::
  closeApp("notepad")
Return

!e::ExitApp
!r::Reload
