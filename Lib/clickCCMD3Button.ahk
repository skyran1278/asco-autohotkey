clickCCMD3Button(buttonName, programName) {
  activateOrExit(programName)

  times := 0
  available := False
  While (available = False) {
    ControlGet, available, Enabled, , % buttonName, % "ahk_exe " . programName . ".exe"
    Sleep, 10
    times += 1

    If (times > 1000) {
      Break
    }
  }

  ControlClick , % buttonName, % "ahk_exe " . programName . ".exe",,,, NA
}
