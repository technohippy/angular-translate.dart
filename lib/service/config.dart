part of translate;

class TranslateConfig {
  String defaultLocale;
  Map<String, Map<String, Object>> translations;

  TranslateConfig([this.defaultLocale, this.translations]) {
    if (this.defaultLocale == null) this.defaultLocale = Intl.defaultLocale;
    if (this.translations == null) this.translations = {};
  }

  void addTranslation(locale, translation) {
    translations.putIfAbsent(locale, () => <String, Object>{});
    translations[locale].addAll(translation);
  }

  Map<String, Object> getResources([String locale]) {
    if (locale == null) locale = this.defaultLocale;
    return translations[locale];
  }
}

class _Translation {
  
}