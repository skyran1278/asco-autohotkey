outputDrawBeam() {
  activateOrExit("RCAD_ASCO")
  WinMenuSelectItem, ahk_exe RCAD_ASCO.exe,, RC梁(B), R2 更改配筋-1

  clickButton("8.1 Write", "RCAD_ASCO")
  WinWaitActive % "ahk_exe " . "notepad" . ".exe",, 10

  activateOrExit("RCAD_ASCO")
  Send, {F2}
}
