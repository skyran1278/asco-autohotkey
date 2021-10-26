clickButtonOrExit(buttonName, programName) {
  If (waitTextVisible(buttonName, programName)) {
    clickButton(buttonName, programName)
    return
  }

  TrayTip Error, % Format("{1:s} 不存在，出現異常，退出程序。", buttonName)
  Exit
}
