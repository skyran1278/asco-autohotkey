#Include %A_ScriptDir%\Lib\

startTime := A_TickCount

iniPath := A_WorkingDir . "\01 Justin\RCAD_ASCO.ini"
filePath := A_WorkingDir . "\01 Justin\2021-0714 計算書.ASCO"
columnCoordinate := {x: 1650, y: 500}

logInASCO(iniPath)
openASCO(filePath)
designSingleColumn(columnCoordinate)

showExecutionTime(startTime, A_TickCount)
