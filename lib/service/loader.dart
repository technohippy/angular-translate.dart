part of translate;

abstract class TranslateLoader {
  String load(String lang);
  
  void loadIn(TranslateConfig config, String lang) {
    config.addTranslation(lang, JSON.decode(load(lang)));
  }
}

class UrlLoader extends TranslateLoader {
  String load(String lang) {
    return "";
  }
}

class StaticFileLoader extends TranslateLoader {
  String load(String lang) {
    return "";
  }  
}

class PartialLoader extends TranslateLoader {
  String load(String lang) {
    return "";
  }
}