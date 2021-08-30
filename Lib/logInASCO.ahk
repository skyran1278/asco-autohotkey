logInASCO(iniPath) {
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_ASCO\DockingPaneLayouts

  logIn(iniPath, "RCAD_ASCO")
}
