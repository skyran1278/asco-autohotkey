designAllColumn() {
  activateOrExit("RCAD_ASCO")
  Send, !c
  activateOrExit("RCAD_ASCO")
  Send, {Down 7}
  ; 這裡不能 active 否則有時候點不到
  ; activateOrExit("RCAD_ASCO")
  Send, {Enter}

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {Enter}

  startDialog()
}
