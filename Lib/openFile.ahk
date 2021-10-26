; 需求: 打開 RCAD 體系的檔案，包含 ASCO, RB, MDB, ...
;
; @parm filePath: A_WorkingDir . "\2021-1021 n345\n345.mdb"
; @parm fileType: ETABS9 (*.MDB)
; @parm programName: RCAD_ASCO
openFile(filePath, fileType, programName) {
  ; 確認程式開啟
  If (!waitTextVisible("選項工具列", programName)) {
    TrayTip Error, % Format("準備執行下一步程序時， {1:s} 尚未啟動。", programName)
    Exit
  }

  activateOrExit(programName)

  WinMenuSelectItem, % "ahk_exe " . programName . ".exe",, 檔案(F), O開舊檔...	Ctrl+O

  ; 輸入 file 路徑
  waitTextVisible("檔案名稱(&N):", programName)
  Control, ChooseString, % fileType, ComboBox2, % "ahk_exe " . programName . ".exe"
  ControlSetText, Edit1, % filePath, % "ahk_exe " . programName . ".exe"
  clickButtonOrExit("開啟(&O)", programName)

  ; 確認程式開啟
  waitTextVisible("選項工具列", programName)
  activateOrExit(programName)
  Send, {F9}

  If (fileType == "ETABS9 (*.MDB)") {
    waitTextVisible("OK,ETABS檔案轉換完成", programName, 100)
    clickButton("確定", "RCAD_ASCO")
  }

  ; 等待檔案讀取完成
  waitTextVisible("狀態區", programName, 100)
}
