restartProgram() {
  activateOrExit("devenv")

  Send, {F5}

  ; Ctrl + Shift + F5
  Send, ^+{F5}
}
