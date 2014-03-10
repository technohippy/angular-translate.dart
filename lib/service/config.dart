part of translate;

class TranslateConfig {
  String _preferredLanguage;
  Map<String, Map<String, Object>> translations;
  TranslateStorage _storage;
  TranslateLoader _loader;
  
  final _localeSeparator = '-';

  TranslateConfig({preferredLanguage, translations, storage, loader}) {
    this.translations = translations == null ? {} : translations;
    this._loader = loader;
    this._storage = storage;
    if (preferredLanguage == null) {
      if (_storage != null) {
        this._preferredLanguage = _storage.getPreferredLanguage();
      }
    }
    else {
      this._preferredLanguage = preferredLanguage;      
    }
    if (this._preferredLanguage == null || this._preferredLanguage.isEmpty) {
      this._preferredLanguage = Intl.defaultLocale == null ? 'en' : Intl.defaultLocale;
    }
    this._storePreferredLanguage();
  }
  
  set storage(TranslateStorage storage) {
    this._storage = storage;
    this._storePreferredLanguage();
  }

  void addTranslation(locale, translation) {
    translations.putIfAbsent(locale, () => <String, Object>{});
    translations[locale].addAll(translation);
  }

  Map<String, Object> getResources([String locale]) {
    if (locale == null) locale = this._preferredLanguage;
    if (translations.containsKey(locale)) {
      return translations[locale];      
    }
    else if (locale.contains(_localeSeparator) 
        && translations.containsKey(locale.split(_localeSeparator)[0])) {
      return translations[locale.split(_localeSeparator)[0]];
    }
    throw "resource not found: $locale";
  }
  
  void _storePreferredLanguage() {
    if (this._storage != null && Intl.defaultLocale != this._preferredLanguage) {
      this._storage.setPreferredLanguage(this.preferredLanguage);
    }
  }
  
  String get preferredLanguage {
    return this._preferredLanguage;
  }
  
  void set preferredLanguage(String preferredLanguage) {
    this._preferredLanguage = preferredLanguage;
    this._storePreferredLanguage();
  }
}
