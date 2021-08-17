restartProductionProgram(workingDir, programName) {
  While WinExist("ahk_exe " . programName . ".exe") {
    WinKill ; 關檔
  }

  Run, % workingDir . "\" programName . ".exe", % workingDir
  WinWaitActive % "ahk_exe " . programName . ".exe",, 6

}
