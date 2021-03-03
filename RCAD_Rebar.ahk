#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

import(file) {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 3000
    } else {
        return
    }

    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Click, 670, 10 ; 專
    Sleep, 1000

    Click, 250, 260 ; OK
    Sleep, 1000

    Click, right, 120, 110 ; 右鍵 分區串 1
    Click, 150, 175 ; 新增分區
    Sleep, 1000
    Click, 270, 20 ; OK
    Sleep, 1000
    Click, Right, 150, 130 ; 右鍵 區數-1
    Click, 200, 230 ; 讀入鋼筋
    Click, 660, 90 ; 左上角
    Click, 1200, 400 ; 右下角
    Send, {Space}
    Sleep, 3000
    Send, {Esc}

    Click, right, 70, 210 ; 右鍵 圖塊 block
    Click, 200, 270 ; 左鍵 import

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    ; Send, {enter}
    ; Sleep, 1000

    ; Click, right, 120, 110 ; 右鍵 分區串 1
    ; Click, 200, 200 ; 左鍵 匯出料單
}

open(file) {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 3000
    } else {
        return
    }

    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Click, right, 70, 210 ; 右鍵 圖塊 block
    Click, 200, 270 ; 左鍵 import

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000

    Send, {enter}
    Sleep, 1000

    Click, right, 120, 110 ; 右鍵 分區串 1
    Click, 200, 200 ; 左鍵 匯出料單
}

export() {
    if WinExist("ahk_exe EXCEL.EXE") {
        WinKill ; 關閉 excel
        Sleep, 1000
    }

    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        Click, 300, 515 ; 左鍵 匯出
        send, {enter} ; 覆蓋檔案
    }
}

!a::
    file := "D:\RCAD_Rebar\10 2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg"
    import(file)
Return

!z::
    file := "D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg"
    open(file)
    export()
Return

!x::
    export()
Return

!t::
    ; SendEvent, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; Send, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendRaw, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendInput, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendPlay, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
Return
