redesignTie() {
  activateOrExit("RCAD_ASCO")
  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC柱(C), R2 更改配筋-1

  closeApp("notepad")
  clickButton("2.12重算繫筋-ALL", "RCAD_ASCO")
  WinWaitActive % "ahk_exe " . "notepad" . ".exe",, 10

  activateOrExit("RCAD_ASCO")
  Send, {F9}
  Send, {F2}
}
