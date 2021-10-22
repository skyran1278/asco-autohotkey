; @Deprecated use openASCOFile instead
openASCO(filePath) {
  activateOrExit("RCAD_ASCO")
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  activateOrExit("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000
}
