#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

open(rb_file, dwg_file) {
    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 1000
    } else {
        return
    }

    if WinExist("ahk_exe RCAD_Building.exe") {
        Send, ^o ; 開啟舊檔
        Sleep, 1000

        Send, {Blind}{Text}%rb_file%
        Send, {enter}
        Send, {enter}
        Sleep, 1000

        Click, 360, 70 ; OK
        Sleep, 3000

        Click, right, 200, 85 ; 右鍵 檔名
        Click, 300, 130 ; 展開

        Click, right, 200, 135 ; 右鍵 Floors
        Click, 300, 175 ; 展開

        Click, right, 200, 495 ; 右鍵 10F
        Click, 300, 480 ; 展開

        Click, 200, 400 ; 點亮 10F
        Click, right, 200, 400 ; 右鍵 10F
        Click, 300, 525 ; 5.匯入dwg檔

        Send, {Blind}{Text}%dwg_file%
        Send, {enter}
        Send, {enter}
        Sleep, 1000

        Click, right, 200, 85 ; 右鍵 10F-Column
        Click, 300, 195 ; 4.輸入柱位-從 DWG
    } else {
        return
    }

}

!z::
    rb_file := "D:\RCAD_Building\00 直接建模-從DWG讀取梁柱模型\A01.rb"
    dwg_file := "D:\RCAD_Building\00 直接建模-從DWG讀取梁柱模型\A01.dwg"
    open(rb_file, dwg_file)
Return
