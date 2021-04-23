#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

isActivate() {
    if WinExist("ahk_exe RCAD_Building.exe") {
        WinActivate ; Use the window found by WinExist.
        return true
    }
    return false
}

open(rb_path, dwg_path, excel_path) {
    if (!isActivate())
        return

    ; 登入
    Send, {enter}
    Sleep, 1000
    Send, {enter}
    Sleep, 4000

    if (!isActivate())
        return

    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%rb_path%
    Send, {enter}
    Send, {enter}
    Sleep, 2000

    if (!isActivate())
        return

    Click, 360, 70 ; OK
    Sleep, 4000

    Click, right, 200, 85 ; 右鍵 檔名
    Click, 300, 130 ; 展開
    Sleep, 1000

    Click, right, 200, 160 ; 右鍵 配筋-柱
    Click, 300, 230 ; 新增
    Sleep, 1000

    Click, 400, 110 ; Read

    Send, {Blind}{Text}%excel_path%
    Send, {enter}
    Send, {enter}
    Sleep, 3000

    if (!isActivate())
        return

    Send, {enter} ; 關閉提示訊息
    Sleep, 1000

    Send, ^w ; 關閉 txt
    Sleep, 1000

    if (!isActivate())
        return

    Click, right, 200, 135 ; 右鍵 Floors
    Click, 300, 175 ; 展開
    Sleep, 1000

    Click, right, 200, 495 ; 右鍵 9F
    Click, 300, 480 ; 展開
    Sleep, 1000

    Click, 200, 400 ; 點亮 9F
    Click, right, 200, 400 ; 右鍵 9F
    Click, 300, 525 ; 5.匯入dwg檔

    Send, {Blind}{Text}%dwg_path%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    if (!isActivate())
        return

    Click, right, 200, 90 ; 右鍵 9F-Column
    Click, 300, 195 ; 4.輸入柱位-從 DWG

}

!z::
    rb_path := "D:\GitHub\autohotkey\RB\2020-0412 從 DWG 讀取柱模型\從 DWG 讀取柱模型.rb"
    dwg_path := "D:\GitHub\autohotkey\RB\2020-0412 從 DWG 讀取柱模型\從 DWG 讀取柱模型.dwg"
    excel_path := "D:\GitHub\autohotkey\RB\2020-0412 從 DWG 讀取柱模型\從 DWG 讀取柱模型.xlsx"
    open(rb_path, dwg_path, excel_path)
Return
