# AUTOHOTKEY

[處理亂碼問題](https://www.autohotkey.com/docs/FAQ.htm#nonascii)

## Mouse Click vs Click

- [using-a-variable-as-a-coordinate-for-click](https://autohotkey.com/board/topic/39592-using-a-variable-as-a-coordinate-for-click/)
- [declaring-coordinates-as-variables](https://autohotkey.com/board/topic/78879-help-with-declaring-coordinates-as-variables/)

## % or %variable%

- [When to use % or %variable% in AutoHotKey?](https://stackoverflow.com/questions/61998672/when-to-use-or-variable-in-autohotkey)
- [Expressions vs Legacy Syntax](https://www.autohotkey.com/docs/Language.htm#expressions-vs-legacy-syntax)

## Lib

### 需求

- 可以是任何資料夾
- 要做版本管理
- 不希望重複

### 解決方法

- 更改為 @rcad@1.0.0 內部在 include 的時候會有問題，同時也要指定版本號，反而不容易維護 (暫不考慮)
- 增加 README.md 寫在裡面不容易發現 (暫不考慮)
- 增加 版本號的 file (試試看)
