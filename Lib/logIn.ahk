; 支援 ASCO, RB, ...
; 按下登入後，不管後面有沒有完成
logIn(iniPath, programName) {
  RegDelete, % "HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\" . programName . "\DockingPaneLayouts"

  ; 登入
  waitTextVisible("登入成功!", programName)
  clickButtonOrExit("確定", programName)

  ; 換參數檔
  waitTextVisible("3.參數檔案", programName)
  clickButtonOrExit("Button6", programName)

  ; 輸入 ini 路徑
  waitTextVisible("檔案名稱(&N):", programName)
  ControlSend, Edit1, {Blind}{Text}%iniPath%, % "ahk_exe " . programName . ".exe"
  clickButtonOrExit("開啟(&O)", programName)

  waitTextVisible("3.參數檔案", programName)
  clickButtonOrExit("OK", programName)
}
