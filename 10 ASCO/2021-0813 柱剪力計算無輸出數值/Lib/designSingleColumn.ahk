designSingleColumn(columnCoordinate, downTimes) {
  activateOrExit("RCAD_ASCO")
  MouseClick, Right, % columnCoordinate.x * (A_ScreenDPI / 96), % columnCoordinate.y * (A_ScreenDPI / 96) ; 右鍵 檔名
  Sleep, 1000
  Send, {Down %downTimes%}
  Send, {Enter}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {F9}
  Sleep, 1000

  activate("RCAD_ASCO")
  Send, {Enter}
  Send, {Right}
  Send, {Enter}
}
