# Change Log

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

Types of changes

- Added for new features.
- Changed for changes in existing functionality.
- Deprecated for soon-to-be removed features.
- Removed for now removed features.
- Fixed for any bug fixes.
- Security in case of vulnerabilities.

## [Unreleased]

## [2.4.0] - 2021-09-07

### ADDED

- 退出 Dialog (exitDialog)
- 開始 Dialog (startDialog)

### FIXED

- 修正全棟計算有時候點不到的問題
- 修正重新啟動 Visual Studio 有時候沒有啟動的問題

### DEPRECATED

- completeDesignColumn

## [2.3.0] - 2021-08-24

### ADDED

- 增加單梁設計

## [2.2.0] - 2021-08-23

### ADDED

- 開發環境中仍然把所有的 ASCO 給關閉再重開

## [2.1.0] - 2021-08-17

### ADDED

- 全棟計算

## [2.0.1] - 2021-08-17

### CHANGED

- 登入 ASCO 時刪除佈局機碼，以維持一致性。
- 刪除自動以 DPI 縮放滑鼠點擊的位置: 不同放大比例的確是 1.25 但由於我們的縮放關係，無法準確對準，所以 (A_ScreenDPI / 96) 無用。

## [2.0.0] - 2021-08-13

### CHANGED

- 以繪圖柱進行單柱設計
- 以幾何梁進行單柱設計: 需要更改函數名稱 designSingleColumn to designSingleColumnByGeometry。

## [1.1.0] - 2021-08-02

### Added

- 單柱設計

## [1.0.0] - 2021-08-02

### Added

- 監測程式有沒有啟動
- 登入 ASCO
- 開啟 ASCO
- 自動重啟程式
- 提示執行時間
