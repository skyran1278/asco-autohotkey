designAllBeam() {
  activateOrExit("RCAD_ASCO")
  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC梁(B), M3 全棟計算

  clickButton("全選", "RCAD_ASCO")

  ; 點其他東西，讓程式可以按 F9
  click 500, 500

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  ; 計算
  startDialog()
  waitForDesign()
  exitDialog()

  ; 設計完成
  clickButton("確定", "RCAD_ASCO")
}
