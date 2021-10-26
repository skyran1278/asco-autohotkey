waitTextVisible(visibleText, programName, timeOut := 10) {
  ; https://www.autohotkey.com/boards/viewtopic.php?t=63999
  times := 0
  available := 0
  While (available != 1) {
    ControlGet, available, Visible, , % visibleText, % "ahk_exe " . programName . ".exe"
    Sleep, 10
    times += 10

    If (times > timeOut * 1000) {
      return false
    }
  }

  return true

  ; 這個方法目前測試不支援 classNN ex: button6
  ; 使用上面的方法更具有彈性
  ; WinWait, % "ahk_exe " . programName . ".exe", % visibleText, 10
  ; if ErrorLevel {
  ;   MsgBox, WinWait timed out.
  ;   return false
  ; }

  ; return true

}
