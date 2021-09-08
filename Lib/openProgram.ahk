openProgram(workingDir, programName) {
  If (env = "production") {
    Run, % workingDir . "\" programName . ".exe", % workingDir
  } Else {
    activateOrExit("devenv")
    Send, {F5}
  }
  WinWaitActive % "ahk_exe " . programName . ".exe",, 5
}
