!q::
  If (env = "production") {
    restartProductionProgram("C:\Program Files\RCAD\RCAD_ASCO\bin", "RCAD_ASCO")
  } Else {
    restartProgram()
  }
Return

!w::
  While WinExist("ahk_exe notepad.exe") {
    WinKill ; 關檔
  }
Return

!e::ExitApp
!r::Reload
