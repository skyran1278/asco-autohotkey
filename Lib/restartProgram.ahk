restartProgram() {
  ; Ctrl + Shift + F5 先
  ; F5 後
  ; 避免太快 F5 後 太快重啟有問題

  activateOrExit("devenv")
  ; Ctrl + Shift + F5
  Send, ^+{F5}

  activateOrExit("devenv")
  Send, {F5}
}
