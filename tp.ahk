#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

open_rb_y := 135
open_dwg_y := 90
export_dwg_y := 240

import_rb(y) {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Building")
        WinActivate

    ; 登入
    Send, {enter}
    Sleep, 1000

    Send, {enter}
    Sleep, 3000

    Click, right, 100, 60 ; 右鍵 root
    Click, 175, 100 ; 新增空檔

    Click, 360, 70 ; OK
    Sleep, 1000

    Click, right, 100, 85 ; 右鍵 building
    Click, 150, 355 ; 新增棧橋
    Sleep, 1000
    Sleep, 1000 ; 贅餘度

    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 170 ; 編輯模型

    Click, 470, 175 ; ...
    Sleep, 1000
    Sleep, 1000 ; 贅餘度

    Click, 500, %y%, 2 ; import excel
    Sleep, 1000

    Click, 170, 325 ; start
    Sleep, 2000

    Click, 300, 325 ; exit
}

open_rb(y) {
    if WinExist("ahk_class #32770") or WinExist("RCAD_Building")
        WinActivate

    ; 登入
    Send, {enter}
    Send, {enter}

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

    Send, {enter} ; 用於第二次輸出
    Sleep, 1000

    Click, right, 100, 110 ; 右鍵 棧橋

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

    Click, 330, %y%, 2 ; 開啟 dwg
    Sleep, 1000

    ; Click, Middle, 500, 500, 2 ; 縮放
    Sleep, 1000

    ; Click, 1100, 710 ; 縮放
    ; Send, {WheelUp 50} ; 縮放
}

caculate_rebar() {
    if WinExist("ahk_class Afx:0000000140000000:b:0000000000010003:0000000000000006:000000000E30006B") or WinExist("ahk_exe RCAD_Building.exe")
        WinActivate

    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 225 ; 計算配筋-預鑄版
    Sleep, 1000
    Click, 400, 170 ; 計算
    Sleep, 8000
    Send, {enter}

    Sleep, 1000
    Click, 70, 110 ; 收斂
    Sleep, 1000
    Click, right, 100, 470 ; 右鍵 鋼筋模型
    Sleep, 1000
    Click, 200, 510 ; 展開
    Sleep, 1000
    Send, {WheelUp 100}
    Sleep, 1000
    Click, right, 100, 470 ; 右鍵 鋼筋模型
    Sleep, 1000
    Click, 200, 510 ; 收斂

    Sleep, 1000
    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 205 ; 計算配筋-預鑄梁
    Sleep, 1000
    Click, 400, 170 ; 計算
    Sleep, 3000
    Send, {enter}

    Sleep, 1000
    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 245 ; 計算配筋-場鑄梁
    Sleep, 1000
    Click, 400, 200 ; 全選
    Click, 400, 260 ; 計算
    Click, 400, 240 ; 計算
    Sleep, 3000
    Send, {enter}

    Sleep, 1000
    Click, right, 100, 110 ; 右鍵 棧橋
    Click, 200, 270 ; 計算配筋-場鑄版
    Sleep, 1000
    Click, 400, 110 ; 全選
    Click, 400, 170 ; 計算
    Click, 400, 150 ; 計算
    Sleep, 3000
    Send, {enter}
}

!1::
    InputBox, user_input, Please input unit and type, Example: 12
    unit_and_type := StrSplit(user_input)

    Switch unit_and_type[1]
    {
    Case "1":
        open_rb_y := 135 ; 單元一
    Case "2":
        open_rb_y := 155 ; 單元二
    Case "5":
        open_rb_y := 175 ; 單元五
    Case "6":
        open_rb_y := 195 ; 單元六
    Case "7":
        open_rb_y := 215 ; 單元一 + 單元二
    }

    Switch unit_and_type[2]
    {
    Case "1":
        ; 平面配置圖
        open_dwg_y := 90
        export_dwg_y := 300
    Case "2":
        ; 場鑄梁
        open_dwg_y := 145
        export_dwg_y := 360
    Case "3":
        ; 場鑄版
        open_dwg_y := 160
        export_dwg_y := 380
    Case "4":
        ; 預鑄梁
        open_dwg_y := 105
        export_dwg_y := 320
    Case "5":
        ; 預鑄版
        open_dwg_y := 130
        export_dwg_y := 340
    Return
}

Return

!z::
    import_rb(open_rb_y)
Return

!x::
    open_rb(open_rb_y)
Return

!a::
    caculate_rebar()
Return

!s::
    export_dwg(export_dwg_y)
Return

!q::
    open_dwg(open_dwg_y)

Return
