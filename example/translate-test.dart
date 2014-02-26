import 'package:angular/angular.dart';
import 'package:angular_translate/translate.dart';

class TranslateModule extends Module {
  TranslateModule() {
    type(TranslateService);
    type(TranslateFilter);
    type(TranslateDirective);
    type(TranslateCloakDirective);

    var translateConfig = new TranslateConfig('ja');
    translateConfig.addTranslation('en', {
      'greeting': 'Hello'
    });
    translateConfig.addTranslation('ja', {
      'greeting': 'こんにちは'
    });
    value(TranslateConfig, translateConfig);
  }
}

main() {
  ngBootstrap(module: new TranslateModule()); 
}
