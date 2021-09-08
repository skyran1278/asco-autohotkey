showExecutionTime(startTime, endTime) {
  elapsedTime := (endTime - startTime) / 1000
  TrayTip 執行時間, % Format("= {1:0.3f}s", elapsedTime)
}
