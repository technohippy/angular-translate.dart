part of translate;

abstract class TranslateStorage {
  static final String _TRANSLATE_LANG = "__translate_lang__";
  
  void setPreferredLanguage(String preferredLanguage) {
    set(_TRANSLATE_LANG, preferredLanguage);
  }
  
  String getPreferredLanguage() {
    return get(_TRANSLATE_LANG);
  }
  
  void set(name, value);
  dynamic get(name);
}

class CookieStorage extends TranslateStorage {
  void set(name, value) {
    dom.document.cookie = "$name=$value;max-age=${60*60*24*7}";
  }
  
  dynamic get(name) {
    String ret;
    dom.document.cookie.split("; ").forEach((pair) {
      var array = pair.split("=");
      if (array[0] == name) { // TODO: compare en-GB to en etc...
        ret = array[1];
      }
    });
    return ret;
  }
}

class LocalStorage extends TranslateStorage {
  void set(name, value) {
    dom.window.localStorage[name] = value;
  }
  
  dynamic get(name) {
    return dom.window.localStorage[name];
  }  
}