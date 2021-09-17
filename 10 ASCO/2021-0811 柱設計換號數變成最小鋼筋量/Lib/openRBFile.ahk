openRBFile(filePath) {
  activateOrExit("RCAD_Building")
  Send, ^o ; 開啟舊檔
  Sleep, 1000

  Send, {Blind}{Text}%filePath%
  Send, {Enter}
  Send, {Enter}
  Sleep, 2000

  activateOrExit("RCAD_Building")
  Send, {F9}
  Sleep, 1000
}
