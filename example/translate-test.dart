import 'package:angular/angular.dart';
import 'package:angular_translate/translate.dart';

class TranslateModule extends Module {
  TranslateModule() {
    type(TranslateService);
    type(TranslateFilter);
    type(TranslateDirective);
    type(TranslateCloakDirective);

    var translateConfig = new TranslateConfig('ja-JP');
    translateConfig.addTranslation('en', {
      'greeting': 'Hello',
      'greetTo': 'Hello, {{name}}'
    });
    translateConfig.addTranslation('ja', {
      'greeting': 'こんにちは',
      'greetTo': 'こんにちは、{{name}}さん'
    });
    value(TranslateConfig, translateConfig);
  }
}

main() {
  ngBootstrap(module: new TranslateModule()); 
}
