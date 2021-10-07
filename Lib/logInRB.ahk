logInRB(iniPath) {
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_Building\DockingPaneLayouts

  programName := "RCAD_Building"

  logIn(iniPath, programName)

  ; 層名代換數= 1
  ; 原因: ACAD對某些字元過敏
  ; ------------------------------
  ; TC-鋼粱 ---> TC.鋼粱
  WinGetText, message, % "ahk_exe " . programName . ".exe"

  If InStr(message, "層名代換數") {
    Send, {Enter}
    Sleep, 1000 ; 避免 login 介面還沒退出 WinWaitActive 誤判

    WinWaitActive % "ahk_exe " . programName . ".exe",, 10
    activateOrExit(programName)
  }
}
