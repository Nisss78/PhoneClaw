import Foundation

// MARK: - Localization Helper

/// 3言語ローカライズ関数（中国語・英語・日本語）
/// システム言語設定に基づいて自動選択
func localized(_ zh: String, _ en: String, _ ja: String? = nil) -> String {
    let languages = Locale.preferredLanguages
    
    // 日本語を最優先（日本語設定の場合）
    if languages.contains(where: { $0.hasPrefix("ja") }) {
        return ja ?? en
    }
    
    // 次に中国語
    if languages.contains(where: { $0.hasPrefix("zh") }) {
        return zh
    }
    
    // デフォルトは英語
    return en
}

/// 思考モードテキスト用のショートカット
func localizedThinkingText(_ zh: String, _ en: String, _ ja: String? = nil) -> String {
    localized(zh, en, ja)
}
