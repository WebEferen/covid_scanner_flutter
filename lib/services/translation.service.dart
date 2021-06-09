class TranslationService {
  static Map<String, String> _translations = new Map();

  static setTranslations(Map<String, String> translations) {
    _translations = translations;
  }

  static getTranslation(String key) {
    return (_translations.containsKey(key)) ? _translations[key] : 'MISSING_TRANSLATION';
  }

  static addTranslation(String key, String value) {
    return _translations.addEntries([MapEntry(key, value)]);
  }
}