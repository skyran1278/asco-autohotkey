; 適用於 一般 exe 程式
closeApp(programName) {
  While WinExist("ahk_exe " . programName . ".exe") {
    WinKill ; 關檔
  }
}
