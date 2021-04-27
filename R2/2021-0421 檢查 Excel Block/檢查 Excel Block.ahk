#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
FileEncoding UTF-8-RAW
CoordMode, Mouse, Client

activate() {
    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.
        return true
    }
    return false
}

import(file) {
    if (!activate())
        return
    ; 登入
    Send, {enter}
    Sleep, 1000
    Send, {enter}
    Sleep, 5000

    if (!activate())
        return
    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 3000

    if (!activate())
        return
    ; Send, {enter} ; 匯入參數表
    Send, {enter} ; no RR file
    Sleep, 1000

    if (!activate())
        return
    Click, 670, 10 ; 專
    Sleep, 1000

    if (!activate())
        return
    Click, 250, 260 ; OK
    Sleep, 1000

    if (!activate())
        return
    Click, 100, 85 ; 計料模組
    Click, right, 120, 110 ; 右鍵 分區串 1
    Click, 150, 175 ; 新增分區
    Sleep, 1000
    Click, 270, 20 ; OK
    Sleep, 1000
    Click, Right, 150, 130 ; 右鍵 區數-1
    Click, 200, 230 ; 讀入鋼筋
    Click, 500, 100 ; 左上角
    Click, 1800, 700 ; 右下角
    Send, {Space}
    Sleep, 10000
    Send, {Esc}

    if (!activate())
        return
    Click, right, 70, 210 ; 右鍵 圖塊 block
    Click, 200, 270 ; 左鍵 import

    Send, {Blind}{Text}%file%
    Send, {enter}
    Send, {enter}
    Sleep, 2000

    ; 匯入 30 筆是正確的
    ; 與 D:\Projects64-Azure\RCAD_Rebar\RCADLL_ODA_Rebar_Element\CRR_Rebar_Legends.h 不一致
    ; 因為 draw_rebar_hoop_beam_column 沒有用到

    if (!activate())
        return
    Send, {Esc}
    Click, right, 120, 110 ; 右鍵 分區串 1
    Click, 200, 200 ; 左鍵 匯出料單
    Sleep, 1000

}

export() {
    if WinExist("ahk_exe EXCEL.EXE") {
        WinKill ; 關閉 excel
        Sleep, 1000
    }

    if WinExist("ahk_exe RCAD_Rebar.exe") {
        WinActivate ; Use the window found by WinExist.

        Click, 300, 690 ; 左鍵 匯出
        send, {enter} ; 覆蓋檔案
    }
}

!z::
    start_time := A_Now

    file := "D:\GitHub\autohotkey\R2\2021-0421 檢查 Excel Block\2021-0426 RCAD-鋼筋型文對照表-圖塊.dwg"
    import(file)
    export()

    TrayTip 執行時間, % A_Now - start_time . "s"
Return

