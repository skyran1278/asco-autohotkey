#Include %A_ScriptDir%\Lib\

startTime := A_TickCount

iniPath := A_WorkingDir . "\02 topTech\RCAD_ASCO_20210610_for Review.ini"
filePath := A_WorkingDir . "\02 topTech\2021-0611 10F-C5.ASCO"
columnCoordinate := {x: 530 / (A_ScreenDPI / 96), y: 280 / (A_ScreenDPI / 96)}

logInASCO(iniPath)
openASCO(filePath)
Sleep, 2000
designSingleColumn(columnCoordinate)

showExecutionTime(startTime, A_TickCount)
