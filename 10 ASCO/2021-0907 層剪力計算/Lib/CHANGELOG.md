# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [3.0.0](https://github.com/skyran1278/autohotkey/compare/v2.6.0...v3.0.0) (2021-09-08)

### ⚠ BREAKING CHANGES

* 將 restartProgram 整合 dev and production，傳入的變數與先前的不一致

### Features

* 將 restartProgram 整合 dev and production ([3fa2254](https://github.com/skyran1278/autohotkey/commit/3fa225433670ca16f6c80fa29eefaec8c70394ac))
* 整合所有的流程到同一個 shortcut ([68dd295](https://github.com/skyran1278/autohotkey/commit/68dd2957c1f3c57cbe03f86bc6b24fe129618378))

## 2.6.0 (2021-09-07)

### Features

* migrate to standard-version to auto generate CHANGELOG ([c76dee5](https://github.com/skyran1278/autohotkey/commit/c76dee5346c87cdeacee433a3af7492d27b0c9af))

## Before 2.6.0 Changelog

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.
We follow [Semantic Versioning](https://semver.org/).

Types of changes

* Added for new features.
* Changed for changes in existing functionality.
* Deprecated for soon-to-be removed features.
* Removed for now removed features.
* Fixed for any bug fixes.
* Security in case of vulnerabilities.

## [2.5.0] - 2021-09-07

### ADDED

* 現在 designAllColumn、designSingleColumn 都可以完全自動完成設計了

## [2.4.0] - 2021-09-07

### ADDED

* 退出 Dialog (exitDialog)
* 開始 Dialog (startDialog)

### FIXED

* 修正全棟計算有時候點不到的問題
* 修正重新啟動 Visual Studio 有時候沒有啟動的問題

### DEPRECATED

* completeDesignColumn

## [2.3.0] - 2021-08-24

### ADDED

* 增加單梁設計

## [2.2.0] - 2021-08-23

### ADDED

* 開發環境中仍然把所有的 ASCO 給關閉再重開

## [2.1.0] - 2021-08-17

### ADDED

* 全棟計算

## [2.0.1] - 2021-08-17

### CHANGED

* 登入 ASCO 時刪除佈局機碼，以維持一致性。
* 刪除自動以 DPI 縮放滑鼠點擊的位置: 不同放大比例的確是 1.25 但由於我們的縮放關係，無法準確對準，所以 (A_ScreenDPI / 96) 無用。

## [2.0.0] - 2021-08-13

### CHANGED

* 以繪圖柱進行單柱設計
* 以幾何梁進行單柱設計: 需要更改函數名稱 designSingleColumn to designSingleColumnByGeometry。

## [1.1.0] - 2021-08-02

### Added

* 單柱設計

## [1.0.0] - 2021-08-02

### Added

* 監測程式有沒有啟動
* 登入 ASCO
* 開啟 ASCO
* 自動重啟程式
* 提示執行時間
