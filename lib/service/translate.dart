part of translate;

class TranslateService {
  TranslateConfig config;

  TranslateService(this.config);
  
  String translate(String key) {
    return this.config.getResources()[key];
  }
}
