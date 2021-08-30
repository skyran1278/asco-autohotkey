activateOrExit(programName) {
  If (activate(programName)) {
    return
  }

  TrayTip Error, % Format("準備執行下一步程序時， {1:s} 尚未啟動。", programName)
  Exit
}
