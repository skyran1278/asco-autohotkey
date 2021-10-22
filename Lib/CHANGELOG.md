# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [3.3.0](https://github.com/skyran1278/autohotkey/compare/v3.2.0...v3.3.0) (2021-10-21)


### Features

* 可重算繫筋 ([3590b6e](https://github.com/skyran1278/autohotkey/commit/3590b6e7d42e9f83c46fdb144210a9492d2bcd4c))
* 可輸出柱表 ([939893f](https://github.com/skyran1278/autohotkey/commit/939893f5d77a73c1a5faabc86a1be03d663850be))
* 梁全棟計算是否考慮 Tu 可由參數控制 ([cf064fb](https://github.com/skyran1278/autohotkey/commit/cf064fbf5f340be2c77120d3c1d79479927886d4))
* 現在可以全棟計算梁了 ([675dfd7](https://github.com/skyran1278/autohotkey/commit/675dfd7af65e7640efaa95bb54cc6546f6d17bc9))
* 現在可以輸出梁表，以供查驗 ([a682fff](https://github.com/skyran1278/autohotkey/commit/a682fff1e72c5e8cd03fd6d149d24f74ffa16ec6))
* 現在可以點擊 ccmd3 的 button 不用再設定等待時間了 ([3e351f2](https://github.com/skyran1278/autohotkey/commit/3e351f2eabdd5047f60c62b6e116b95be407c963))


### Bug Fixes

* 有可能會出現 ACAD對某些字元過敏 提示視窗，修正避免影響 RB 登入 ([a4bf38e](https://github.com/skyran1278/autohotkey/commit/a4bf38e61eb06e5446392078562486eab5928cce))
* 延長開啟 debug 程式的等待時間 ([cc5e186](https://github.com/skyran1278/autohotkey/commit/cc5e186b53a375cd61378e003048cc51af2c4af5))
* 修正 clickButton 可能沒有按到按鈕 ([daa72a8](https://github.com/skyran1278/autohotkey/commit/daa72a8e27cb60ed49fb2a6fa677df3dde8b8ed9))
* 修正重設繫筋沒有保存結果 ([5c96446](https://github.com/skyran1278/autohotkey/commit/5c96446d7ca991f253ee2b59b6dd36a3a40003f9))
* 修正輸出柱表可能沒有退出 ([12a9838](https://github.com/skyran1278/autohotkey/commit/12a98386c6ab2e5b0f608bc618ab84600adfb153))
* 開放 WinWaitActive 到 10 秒，避免啟動時過慢而退出 ([afe38bd](https://github.com/skyran1278/autohotkey/commit/afe38bd42f495593bd2cca4722a199ccf01a702e))

## [3.2.0](https://github.com/skyran1278/autohotkey/compare/v3.0.0...v3.2.0) (2021-09-30)


### Features

* 增加 open program 的等待時間 ([f25cb2a](https://github.com/skyran1278/autohotkey/commit/f25cb2a34f26937a045a5be77d23918a7d66500b))
* 支援可以關閉一般程式 ([d6bfcdf](https://github.com/skyran1278/autohotkey/commit/d6bfcdfa9efd37d87714b910f59097d58694bef3))
* 支援打開 RB 檔案 ([9f80aaa](https://github.com/skyran1278/autohotkey/commit/9f80aaad186d4501887c1f9e9351a8a152ebde4a))
* 現在可以登入 rb 了 ([6731f28](https://github.com/skyran1278/autohotkey/commit/6731f28bbb0c9493f6933e13f39ecbf4b19266fa))
* 自動重新啟動 rb ([c859911](https://github.com/skyran1278/autohotkey/commit/c8599113bfcdaae43d7d040dc476429e71537d5b))


### Bug Fixes

* 開發環境也會等待 asco 重啟 ([da1c1bd](https://github.com/skyran1278/autohotkey/commit/da1c1bd32ebb51bd99d5a492b1cf724f8f35c37b))

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
