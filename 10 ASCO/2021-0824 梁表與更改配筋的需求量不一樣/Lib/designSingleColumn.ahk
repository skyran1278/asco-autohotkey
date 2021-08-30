designSingleColumn(columnCoordinate, downTimes) {
  activateOrExit("RCAD_ASCO")
  ; 不同放大比例的確是 1.25 但由於我們的縮放關係，無法準確對準，所以 * (A_ScreenDPI / 96) 無用
  MouseClick, Right, % columnCoordinate.x, % columnCoordinate.y ; 右鍵 檔名
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
