part of translate;

class TranslateConfig {
  String _preferredLanguage;
  String fallbackLanguage;
  Map<String, Map<String, Object>> translations;
  TranslateStorage _storage;
  TranslateLoader _loader;
  List<String> _loadingLocales = <String>[];
  
  final _localeSeparator = '-';

  TranslateConfig({preferredLanguage, fallbackLanguage, translations, storage, loader}) {
    this.translations = translations == null ? {} : translations;
    this._loader = loader;
    this._storage = storage;
    this.fallbackLanguage = fallbackLanguage;
    
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
  
  set loader(TranslateLoader loader) {
    this._loader = loader;
  }

  void addTranslation(locale, translation) {
    translations.putIfAbsent(locale, () => <String, Object>{});
    translations[locale].addAll(translation);
  }

  Map<String, Object> getResources([String locale]) {
    if (locale == null) locale = this._preferredLanguage;
    String verifiedLocale = Intl.verifiedLocale(locale, localeExists, onFailure: _handleLocaleError);
    if (verifiedLocale == null) {
      verifiedLocale = Intl.verifiedLocale(fallbackLanguage, localeExists, onFailure: _handleLocaleError);
      if (verifiedLocale == null) {
        throw "resource not found: $locale";
      }
    }
    return translations[verifiedLocale];
  }
  
  void _handleLocaleError(String lang) {
    _preferredLanguage = null;
    if (_loader != null && !_loadingLocales.contains(lang)) {
      _loadingLocales.add(lang);
      _loader.loadIn(this, lang).then((json) {
        this.preferredLanguage = lang;
        _loadingLocales.remove(lang);
      });
    }
  }
  
  bool localeExists(String localeName) {
    return localeName != null && translations.containsKey(localeName);
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
