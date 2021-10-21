designAllBeam(isConsiderTu := False) {
  activateOrExit("RCAD_ASCO")
  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC梁(B), M3 全棟計算

  clickButton("全選", "RCAD_ASCO")

  If (isConsiderTu) {
    ; 1.4.1 逕依 4.7.2.2 式指定設計扭矩 Tu
    clickButton("Button8", "RCAD_ASCO")

    ; 1.5.1 依 4.7.3.7 與 4.7.5.3 設計縱向扭力筋量
    clickButton("Button13", "RCAD_ASCO")
  }

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
  WinWaitActive % "ahk_exe " . "notepad" . ".exe",, 30
  clickButton("確定", "RCAD_ASCO")
}
