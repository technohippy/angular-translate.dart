part of translate;

class TranslateConfig {
  String preferredLanguage;
  Map<String, Map<String, Object>> translations;

  final _localeSeparator = '-';
  
  TranslateConfig([this.preferredLanguage, this.translations]) {
    if (this.preferredLanguage == null) this.preferredLanguage = Intl.defaultLocale;
    if (this.translations == null) this.translations = {};
  }

  void addTranslation(locale, translation) {
    translations.putIfAbsent(locale, () => <String, Object>{});
    translations[locale].addAll(translation);
  }

  Map<String, Object> getResources([String locale]) {
    if (locale == null) locale = this.preferredLanguage;
    if (translations.containsKey(locale)) {
      return translations[locale];      
    }
    else if (locale.contains(_localeSeparator) 
        && translations.containsKey(locale.split(_localeSeparator)[0])) {
      return translations[locale.split(_localeSeparator)[0]];
    }
    throw "resource not found: $locale";
  }
}

class _Translation {
  
}