designAllColumn() {
  activateOrExit("RCAD_ASCO")
  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC柱(C), M3 全棟計算

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {Enter}

  ; 建立 PMM
  startDialog()
  waitForDesign()
  exitDialog()

  ; 計算
  startDialog()
  waitForDesign()
  exitDialog()
}
