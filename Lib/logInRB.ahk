logInRB(iniPath) {
  programName := "RCAD_Building"

  RegDelete, % "HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\" . programName . "\DockingPaneLayouts"

  ; 登入
  waitTextVisible("登入成功!", programName)
  clickButtonOrExit("確定", programName)

  ; 換參數檔
  waitTextVisible("3.參數檔案", programName)
  clickButtonOrExit("Button7", programName)

  ; 輸入 ini 路徑
  waitTextVisible("檔案名稱(&N):", programName)
  ControlSend, Edit1, {Blind}{Text}%iniPath%, % "ahk_exe " . programName . ".exe"
  clickButtonOrExit("開啟(&O)", programName)

  waitTextVisible("3.參數檔案", programName)
  clickButtonOrExit("OK", programName)

  WinWaitActive % "ahk_exe " . programName . ".exe",, 10
  available := 0
  ControlGet, available, Visible, , 原因: ACAD對某些字元過敏, % "ahk_exe " . programName . ".exe"

  If (available == 1) {
    TrayTip Error, % Format("準備執行下一步程序時， {1:s} 尚未啟動。", programName)
    clickButtonOrExit("確定", programName)
  }

  If (!waitTextVisible("xtpBarTop", programName)) {
    TrayTip Error, % Format("準備執行下一步程序時， {1:s} 尚未啟動。", programName)
    Exit
  }

  activateOrExit(programName)
}
