#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

open() {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Rebar")
        WinActivate

    ; 登入
    send, {enter}
    send, {enter}

    Sleep, 3000

    Click, 260, 40 ; 左鍵 點選目錄
    Send, ^o ; 開啟舊檔
    Sleep, 1000

    Click, 500, 140, 2 ; 開啟
    Sleep, 1000

    send, {enter}
    send, {enter}

    Sleep, 1000
    Click, 70, 85 ; 計料模組

    send, {WheelDown 20}

    Click, right, 70, 280 ; 右鍵 圖塊 block
    Click, 200, 340 ; 左鍵 import

    Sleep, 1000
    Click, 500, 135, 2 ; 開啟

    Sleep, 1000
    Click, 410, 110 ; 左鍵 bar
    send, {WheelUp 20}
    Click, right, 120, 110 ; 右鍵 分區串 1
    Click, 200, 200 ; 左鍵 匯出料單

}

export() {

    if WinExist("ahk_exe EXCEL.EXE")
        WinActivate

    Send, ^w ; 關閉 excel

    if WinExist("ahk_class #32770") or WinExist("RCAD_Rebar")
        WinActivate

    Click, 300, 490 ; 左鍵 匯出

    send, {enter} ; 覆蓋檔案
    Sleep, 5000

    send, {enter} ; 完成
}

; open_dwg() {
;     if WinExist("ahk_class AfxMDIFrame140u") or WinExist("RCAD_Building")
;         WinActivate

;     Send, ^o ; 開啟舊檔

;     Sleep, 1000
;     Click, 330, 90, 2 ; 開啟 dwg
;     Sleep, 1000
;     Click, Middle, 500, 500, 2 ; 縮放
; }

; !a::
;     open()
;     export_dwg()
;     Sleep, 5000
;     open_dwg()
; Return

!z::
    open()
    export()
Return

; !s::
;     export_dwg()
; Return

!x::
    export()
Return

; ^j::
;     if WinExist("ahk_class Afx:0000000140000000:b:0000000000010003:0000000000000006:0000000008AD1111") or WinExist("- RCAD_Building")
;         WinActivate

;     ControlClick, "設定(S)"
