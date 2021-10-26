clickButton(buttonName, programName) {
  waitTextVisible(buttonName, programName)

  ; WinWait , % "ahk_exe " . programName . ".exe", % buttonName, 10

  ControlClick , % buttonName, % "ahk_exe " . programName . ".exe",,,, NA
}
