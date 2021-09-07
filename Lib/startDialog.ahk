startDialog() {
  activate("RCAD_ASCO")
  ; 會反應不過來，有個跳出的時間差
  ; ControlClick , start, ahk_exe RCAD_ASCO.exe

  Send, {Tab}
  activate("RCAD_ASCO")
  Send, {Enter}
}
