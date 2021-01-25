#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

import_rb(y) {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Building")
        WinActivate

    ; 登入
    send, {enter}
    Sleep, 1000

    send, {enter}
    Sleep, 3000

    Click, right, 100, 60 ; 右鍵 root
    Click, 175, 100 ; 新增空檔
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 1000

    Click, right, 100, 85 ; 右鍵 building
    Click, 150, 355 ; 新增棧橋
    Sleep, 1000

    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 170 ; 編輯模型
    Sleep, 1000

    Click, 470, 175 ; ...
    Sleep, 1000

    Click, 500, %y%, 2 ; import excel
    Sleep, 3000

    Click, 170, 325 ; start
    Sleep, 2000

    Click, 300, 325 ; exit
}

open_rb(y) {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Building")
        WinActivate

    ; 登入
    send, {enter}
    send, {enter}

    Send, ^o ; 開啟舊檔
    Sleep, 5000 ; 實測一定要

    Click, 500, %y%, 2 ; 開啟 rb
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 4000

    Click, right, 70, 85 ; 右鍵 檔名
    Click, 120, 130 ; 展開
}

export_dwg(y) {
    if WinExist("ahk_class Afx:0000000140000000:b:0000000000010003:0000000000000006:000000000E30006B") or WinExist("ahk_exe RCAD_Building.exe")
        WinActivate

    send, {enter} ; 用於第二次輸出
    Sleep, 1000

    Click, right, 100, 110 ; 右鍵 棧橋

    ; Click, 195, 240 ; 匯出平面配置圖 DWG
    ; Click, 195, 260 ; 匯出預鑄梁 DWG
    ; Click, 195, 280 ; 匯出預鑄版 DWG
    ; Click, 195, 335 ; 匯出場鑄梁 DWG
    ; Click, 195, 375 ; 匯出場鑄版 DWG
    Click, 195, %y% ; 匯出 DWG
    Sleep, 1000

    Click, 360, 70 ; OK
    Sleep, 7000
}

open_dwg(y) {
    if WinExist("ahk_class AfxMDIFrame140u") or WinExist("RCAD_Building")
        WinActivate

    Send, ^o ; 開啟舊檔
    Sleep, 1000

    ; Click, 330, 90, 2 ; 開啟 dwg 平面配置圖
    ; Click, 330, 105, 2 ; 開啟 dwg 預鑄梁
    ; Click, 330, 130, 2 ; 開啟 dwg 預鑄版
    ; Click, 330, 145, 2 ; 開啟 dwg 場鑄梁
    ; Click, 330, 160, 2 ; 開啟 dwg 場鑄版
    Click, 330, %y%, 2 ; 開啟 dwg
    Sleep, 1000

    ; Click, Middle, 500, 500, 2 ; 縮放
    Sleep, 1000

    ; Click, 1100, 710 ; 縮放
    ; send, {WheelUp 50} ; 縮放
}

InputBox, UserInput, "單元 + 形式", "單元一(1), 單元二(2), ..."

open_rb_y := 135 ; 單元一
; open_rb_y := 155 ; 單元二
; open_rb_y := 175 ; 單元五
; open_rb_y := 195 ; 單元六
; open_rb_y := 215 ; 單元一 + 單元二

; 平面配置圖
open_dwg_y := 90
export_dwg_y := 240

; 場鑄梁
open_dwg_y := 145
export_dwg_y := 335

; 場鑄版
; open_dwg_y := 160
; export_dwg_y := 375

; 預鑄梁
; open_dwg_y := 105
; export_dwg_y := 260

; 預鑄版
; open_dwg_y := 130
; export_dwg_y := 280

switch UserInput
{
case "btw":
    Send, {backspace 4}by the way
Return
case "otoh":
    Send, {backspace 5}on the other hand
Return
}
Return

; import
!1::
    import_rb(open_rb_y)
Return

; all
!a::
    open_rb(open_rb_y)
    export_dwg(export_dwg_y)
    open_dwg(open_dwg_y)
Return

!z::
    open_rb(open_rb_y)
    export_dwg(export_dwg_y)
Return

!s::
    export_dwg(export_dwg_y)
Return

; dxf
!x::
    open_dwg(open_dwg_y)

Return
