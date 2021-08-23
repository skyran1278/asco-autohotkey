designAllColumn() {
  activateOrExit("RCAD_ASCO")
  Send, !c
  activateOrExit("RCAD_ASCO")
  Send, {Down 7}
  Send, {Enter}

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {Enter}
  activate("RCAD_ASCO")
  Send, {Right}
  activate("RCAD_ASCO")
  Send, {Enter}
}
