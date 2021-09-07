openProgram(workingDir, programName) {
  If (env = "production") {
    Run, % workingDir . "\" programName . ".exe", % workingDir
    WinWaitActive % "ahk_exe " . programName . ".exe",, 5
  } Else {
    activateOrExit("devenv")
    Send, {F5}
  }
}
