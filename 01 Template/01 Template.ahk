#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

activate() {
    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.
        return true
    }
    return false
}

open(rb_path, dwg_path, excel_path) {
    if (!activate())
        return
    ; 登入
    Send, {enter}
    Sleep, 1000
    activate()
    Send, {enter}
    Sleep, 4000

    if (!activate())
        return
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%rb_path%
    Send, {enter}
    Send, {enter}
    Sleep, 2000

    if (!activate())
        return
    Click, 360, 70 ; OK
    Sleep, 4000

    activate()
    Click, right, 200, 85 ; 右鍵 檔名
    Click, 300, 130 ; 展開
    Sleep, 1000
}

!1::
    start_time := A_TickCount

    rb_path := "D:\GitHub\autohotkey\RB\2021-0423 科建 SRC2.1\2021-0423 科建 SRC2.1.rb"
    dwg_path := "D:\GitHub\autohotkey\RB\2021-0423 科建 SRC2.1\2021-0423 科建 SRC2.1.dwg"
    excel_path := "D:\GitHub\autohotkey\RB\2021-0423 科建 SRC2.1\2021-0423 科建 SRC2.1.xlsx"
    open(rb_path, dwg_path, excel_path)

    elapsed_time := (A_TickCount - start_time) / 1000
    TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

!r::Reload

!w::
    While WinExist("ahk_exe notepad.exe") {
        WinKill ; 關檔
    }
Return

!t::
    ; 測試用
    start_time := A_TickCount

    elapsed_time := (A_TickCount - start_time) / 1000
    TrayTip 執行時間, % Format("= {1:0.3f}s", elapsed_time)
Return

