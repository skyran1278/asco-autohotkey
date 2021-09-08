; 適用於 RCAD_ASCO, RCAD_Building, ...
closeProgram(programName) {
  If (env != "production") {
    activateOrExit("devenv")
    ; Shift + F5
    Send, +{F5}
  }

  While WinExist("ahk_exe " . programName . ".exe") {
    WinKill ; 關檔
  }
}
