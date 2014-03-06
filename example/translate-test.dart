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
      'GREETING': 'Hello',
      'GREET_TO': 'Hello, {{name}}',
      'NAMESPACE': {
        'GREETING': 'How are you?'
      }
    });
    translateConfig.addTranslation('ja', {
      'GREETING': 'こんにちは',
      'GREET_TO': 'こんにちは、{{name}}さん',
      'NAMESPACE': {
        'GREETING': '元気？'
      }
    });
    value(TranslateConfig, translateConfig);
  }
}

main() {
  ngBootstrap(module: new TranslateModule()); 
}
