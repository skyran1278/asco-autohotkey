waitForDesign() {
  exitOrAbort := ""
  While, exitOrAbort != "exit" {
    ; 出現意外狀況
    If (exitOrAbort = "確定") {
      Send, {Enter}
    }
    ControlGetText, exitOrAbort , Button1, ahk_exe RCAD_ASCO.exe
  }
}

