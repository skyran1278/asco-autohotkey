logIn(iniPath, programName) {
  activateOrExit(programName)
  ; 登入
  Send, {Enter}
  Sleep, 1000

  activateOrExit(programName)
  Send, {Tab 5}
  Send, {Enter}

  Send, {Blind}{Text}%iniPath%
  Send, {Enter}
  Sleep, 1000

  Send, {Tab}

  Send, {Enter}
  Sleep, 1000 ; 避免 login 介面還沒退出 WinWaitActive 誤判

  WinWaitActive % "ahk_exe " . programName ".exe",, 6
  activateOrExit(programName)
}

