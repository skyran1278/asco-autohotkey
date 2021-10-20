; 適用於 RCAD_ASCO, RCAD_Building, ...
openProgram(workingDir, programName) {
  If (env = "production") {
    Run, % workingDir . "\" programName . ".exe", % workingDir
  } Else {
    activateOrExit("devenv")
    Send, {F5}
  }
  WinWaitActive % "ahk_exe " . programName . ".exe",, 30
}
