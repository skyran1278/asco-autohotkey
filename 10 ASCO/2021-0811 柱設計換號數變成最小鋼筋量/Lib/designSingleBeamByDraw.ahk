designSingleBeamByDraw(columnCoordinate) {
  activateOrExit("RCAD_ASCO")
  ; 不同放大比例的確是 1.25 但由於我們的縮放關係，無法準確對準，所以 * (A_ScreenDPI / 96) 無用
  MouseClick, Right, % columnCoordinate.x, % columnCoordinate.y ; 右鍵 檔名
  Sleep, 1000
  Send, {Down 8}
  Send, {Enter}
  Sleep, 1000

  ; Active Toptech format
  activate("RCAD_ASCO")
  MouseClick, Left, % 470 * (A_ScreenDPI / 96), % 800 * (A_ScreenDPI / 96)
  Sleep, 1000
  activate("RCAD_ASCO")
  MouseClick, Left, % 300 * (A_ScreenDPI / 96), % 460 * (A_ScreenDPI / 96), 2

  Send, {F9}
  Sleep, 1000
}
