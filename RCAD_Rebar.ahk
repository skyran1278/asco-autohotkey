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

    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        Click, 260, 40 ; 左鍵 點選目錄
        Send, ^o ; 開啟舊檔
        Sleep, 1000

        Send, {Blind}{Text}%file%
        Send, {enter}
        Send, {enter}
        Sleep, 1000

        ; Send, {enter} ; 匯入參數表
        Send, {enter} ; no RR file
        Sleep, 1000

        Click, 670, 10 ; 專
        Sleep, 1000

        Click, 250, 260 ; OK
        Sleep, 1000

        Click, 100, 85 ; 計料模組
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
        Sleep, 5000
        Send, {Esc}

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
    } else {
        return
    }

}

open(file) {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 4000
    } else {
        return
    }

    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Sleep, 1000

    Send, {enter} ; 匯入參數表
    Send, {enter} ; 0x2D...
    Sleep, 1000

    Click, right, 70, 210 ; 右鍵 圖塊 block
    Click, 200, 270 ; 左鍵 import
    ; Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter} ; open
    Sleep, 1000

    Send, {enter} ; 匯入鋼筋圖示
    Sleep, 1000

    Send, {Esc}
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

import_template(file) {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        ; 登入
        Send, {enter}
        Sleep, 1000
        Send, {enter}
        Sleep, 4000
    } else {
        return
    }

    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Sleep, 1000

    Send, {enter} ; 匯入參數表
    Send, {enter} ; no RR file
    Sleep, 1000

    Click, 670, 10 ; 專
    Sleep, 1000

    Click, 250, 260 ; OK
    Sleep, 1000

    Click, 100, 85 ; 計料模組
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
    Sleep, 5000
    Send, {Esc}

    Click, right, 70, 210 ; 右鍵 圖塊 block
    Click, 200, 270 ; 左鍵 import

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 1000
}

!x::
    file := "D:\RCAD_Rebar\RCAD-鋼筋型文對照表-圖塊SigoAva-Mu-MEI-AVA-20210401.dwg"
    import(file)
Return

!s::
    file := "D:\RCAD_Rebar\10 do not have rr file (only circle).dwg"
    import_template(file)
Return

!z::
    file := "D:\RCAD_Rebar\10 already have rr file.dwg"
    open(file)
    export()
Return

!a::
    export()
Return

!t::
    ; SendEvent, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; Send, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendRaw, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendInput, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
    ; SendPlay, D:\RCAD_Rebar\2021-0302 RCAD-鋼筋型文對照表-圖塊SigoAva-Mu.dwg ; 開啟舊檔
Return
