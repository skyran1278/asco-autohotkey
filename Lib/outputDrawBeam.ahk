outputDrawBeam() {
  programName := "RCAD_ASCO"

  If (!waitTextVisible("xtpBarTop", programName)) {
    TrayTip Error, % Format("準備輸出梁表時， {1:s} 尚未啟動。", programName)
    Exit
  }

  WinMenuSelectItem, % "ahk_exe " . programName . ".exe",, RC梁(B), R2 更改配筋-1

  clickButton("8.1 Write", programName)
  WinWaitActive % "ahk_exe " . "notepad" . ".exe",, 10

  activateOrExit(programName)
  ControlSend, , {F2}, % "ahk_exe " . programName . ".exe"
}
