activate(programName) {
  if WinExist("ahk_exe " . programName . ".exe") {
    WinActivate ; Use the window found by WinExist.
    return true
  }
  return false
}
