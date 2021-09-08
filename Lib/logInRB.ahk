logInRB(iniPath) {
  RegDelete, HKEY_CURRENT_USER\SOFTWARE\RCAD.APPS\RCAD_Building\DockingPaneLayouts

  logIn(iniPath, "RCAD_Building")
}
