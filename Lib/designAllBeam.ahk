designAllBeam(isConsiderTu := False) {
  programName := "RCAD_ASCO"

  If (!waitTextVisible("xtpBarTop", programName)) {
    TrayTip Error, % Format("準備執行梁全棟計算時， {1:s} 尚未啟動。", programName)
    Exit
  }

  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC梁(B), M3 全棟計算

  clickButton("全選", programName)

  If (isConsiderTu) {
    ; 1.4.1 逕依 4.7.2.2 式指定設計扭矩 Tu
    clickButton("Button8", programName)

    ; 1.5.1 依 4.7.3.7 與 4.7.5.3 設計縱向扭力筋量
    clickButton("Button13", programName)
  }

  activate(programName)
  ControlSend, , {F9}, ahk_exe RCAD_ASCO.exe

  ; 計算
  startDialog()
  waitForDesign()
  exitDialog()

  ; 設計完成
  waitTextVisible("設計完成", programName)

  ; 目前實測一定要有 activate(programName)，尚不清楚原因
  activate(programName)
  clickButton("確定", programName)
}
