clickButton(buttonName, programName) {
  activateOrExit(programName)

  ; https://www.autohotkey.com/boards/viewtopic.php?t=63999
  times := 0
  available := 0
  While (available != 1) {
    ControlGet, available, Visible, , % buttonName, % "ahk_exe " . programName . ".exe"
    Sleep, 10
    times += 1

    If (times > 1000) {
      MsgBox, % "找不到 button: " . buttonName
      Break
    }
  }

  ; WinWait , % "ahk_exe " . programName . ".exe", % buttonName, 10

  ControlClick , % buttonName, % "ahk_exe " . programName . ".exe",,,, NA
}
