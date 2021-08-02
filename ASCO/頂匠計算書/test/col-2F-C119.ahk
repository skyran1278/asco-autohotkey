#Include %A_ScriptDir%\Lib\

startTime := A_TickCount
iniPath := A_WorkingDir . "\01 Justin\RCAD_ASCO.ini"
filePath := A_WorkingDir . "\01 Justin\2021-0714 計算書.ASCO"

logInASCO(iniPath)
openASCO(filePath)

activateOrExit("RCAD_ASCO")
MouseClick, Right, % 1650 * (A_ScreenDPI / 96), % 500 * (A_ScreenDPI / 96) ; 右鍵 檔名
Sleep, 100
Send, {Down 4}
Send, {Enter}
Sleep, 1000

activate("RCAD_ASCO")
Send, {F9}
Sleep, 1000

activate("RCAD_ASCO")
Send, {Enter}
Send, {Right}
Send, {Enter}

showExecutionTime(startTime, A_TickCount)
