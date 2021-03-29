#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

open(file) {
    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 3000
    } else {
        return
    }

    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 3000

    Click, right, 70, 85 ; 右鍵 檔名
    Click, 120, 130 ; 展開

}

!z::
    file := "D:\RCAD_Building\00 直接建模-從DWG讀取梁柱模型\A01.rb"
    open(file)
Return
