import 'package:angular/angular.dart';
import 'package:angular_translate/translate.dart';

@NgController(
  selector: 'body',
  publishAs: 'ctrl'
)
class TranslateCtrl {
  final TranslateConfig translateConfig;
  
  TranslateCtrl(this.translateConfig);
  
  changeLanguage(lang) {
    this.translateConfig.preferredLanguage = lang;
  }
}

class TranslateModule extends Module {
  TranslateModule() {
    type(TranslateService);
    type(TranslateFilter);
    type(TranslateDirective);
    type(TranslateCloakDirective);
    type(TranslateCtrl);

    var translateConfig = new TranslateConfig(storage: new CookieStorage());
    translateConfig.addTranslation('en', {
      'BUTTON_LAMG_EN': 'English',
      'BUTTON_LAMG_JA': 'Japanese',
      'GREETING': 'Hello',
      'GREET_TO': 'Hello, {{name}}',
      'NAMESPACE': {
        'GREETING': 'How are you?'
      }
    });
    translateConfig.addTranslation('ja', {
      'BUTTON_LAMG_EN': '英語',
      'BUTTON_LAMG_JA': '日本語',
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
