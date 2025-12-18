//
//  Localization.swift
//  ScrollSnap
//

import Foundation

/// Lightweight localization helper that switches between English and Chinese
/// based on the user's preferred system language.
struct Localization {
    static let shared = Localization()
    
    private enum Language {
        case english
        case chinese
    }
    
    private let language: Language
    
    private init() {
        let preferredIdentifier = Locale.preferredLanguages.first?.lowercased()
            ?? Locale.current.identifier.lowercased()
        language = preferredIdentifier.hasPrefix("zh") ? .chinese : .english
    }
    
    var appDisplayName: String { "ScrollSnap" }
    
    // MARK: - Menu bar
    var aboutMenuTitle: String { language == .chinese ? "关于 ScrollSnap" : "About ScrollSnap" }
    var preferencesMenuTitle: String { language == .chinese ? "偏好设置…" : "Preferences…" }
    var quitMenuTitle: String { language == .chinese ? "退出 ScrollSnap" : "Quit ScrollSnap" }
    var settingsWindowTitle: String { language == .chinese ? "ScrollSnap 偏好设置" : "ScrollSnap Preferences" }
    var resetPositionsTitle: String { language == .chinese ? "重置选区和菜单位置" : "Reset Selection and Menu Positions" }
    func versionLabel(_ version: String) -> String { language == .chinese ? "版本 \(version)" : "Version \(version)" }
    
    // MARK: - Capture menu
    func captureButtonLabel(isCapturing: Bool) -> String {
        if isCapturing {
            return language == .chinese ? "保存" : "Save"
        }
        return language == .chinese ? "捕获" : "Capture"
    }
    var optionsButtonLabel: String { language == .chinese ? "选项 " : "Options " }
    var saveToLabel: String { language == .chinese ? "保存到" : "Save to" }
    
    func destinationDisplayName(for key: String) -> String {
        switch key {
        case "Desktop":
            return language == .chinese ? "桌面" : "Desktop"
        case "Documents":
            return language == .chinese ? "文稿" : "Documents"
        case "Downloads":
            return language == .chinese ? "下载" : "Downloads"
        case "Clipboard":
            return language == .chinese ? "剪贴板" : "Clipboard"
        case "Preview":
            return language == .chinese ? "预览" : "Preview"
        default:
            return key
        }
    }
    
    // MARK: - Permissions UI
    var permissionWindowTitle: String { language == .chinese ? "屏幕录制权限" : "Screen Recording Permission" }
    var permissionTitle: String { language == .chinese ? "需要屏幕录制权限" : "Screen Recording Permission Required" }
    var permissionBody: String {
        language == .chinese
            ? "ScrollSnap 需要屏幕录制权限来捕捉屏幕。"
            : "ScrollSnap needs screen recording permission to capture screenshots."
    }
    var permissionInstruction: String {
        language == .chinese
            ? "请在系统设置 > 隐私与安全性 > 屏幕录制中启用，然后重新启动应用。"
            : "Please enable it in System Settings > Privacy & Security > Screen Recording, then relaunch the app."
    }
    var quitActionTitle: String { language == .chinese ? "退出" : "Quit" }
    
    // MARK: - Thumbnail context menu
    var contextSave: String { language == .chinese ? "保存" : "Save" }
    var contextDelete: String { language == .chinese ? "删除" : "Delete" }
    var contextClose: String { language == .chinese ? "关闭" : "Close" }
    
    // MARK: - Permission prompts
    func folderAccessPrompt(for folderDisplayName: String) -> String {
        if language == .chinese {
            return "请选择你的\(folderDisplayName)文件夹，授予 ScrollSnap 保存截图的权限。"
        } else {
            return "Please select your \(folderDisplayName) folder to grant ScrollSnap permission to save screenshots there."
        }
    }
}
