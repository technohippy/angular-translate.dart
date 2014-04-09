part of translate;

abstract class TranslateLoader {
  Future<String> load(String lang);
  
  Future<Map<String, Object>> loadIn(TranslateConfig config, String lang) {
    return load(lang).then((String responseText) {
      Map<String, Object> json = JSON.decode(responseText);
      config.addTranslation(lang, json);
      return json;
    });
  }
}

class UrlLoader extends TranslateLoader {
  final String _baseUrl;
  
  UrlLoader(String baseUrl) : _baseUrl = baseUrl;
  
  Future<String> load(String lang) {
    return dom.HttpRequest.getString(_getFileUrl(lang));
  }
  
  String _getFileUrl(String lang) {
    return "$_baseUrl?lang=$lang";
  }
}

class StaticFileLoader extends TranslateLoader {
  final String _prefix;
  final String _suffix;
  
  StaticFileLoader({prefix, suffix}) : 
    _prefix = prefix,
    _suffix = suffix {
  }
  
  Future<String> load(String lang) {
    return dom.HttpRequest.getString(_getFileUrl(lang));
  }
  
  String _getFileUrl(String lang) {
    return "$_prefix$lang$_suffix";
  }
}

/*
class PartialLoader extends TranslateLoader {
  Future<String> load(String lang) {
    return null;
  }
}
*/