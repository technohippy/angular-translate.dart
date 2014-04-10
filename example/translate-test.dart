import 'package:angular/angular.dart';
import 'package:angular_translate/translate.dart';

@NgController(
  selector: 'body',
  publishAs: 'ctrl'
)
class TranslateCtrl {
  final TranslateConfig translateConfig;
  final dateTime = new DateTime.now();
  
  TranslateCtrl(this.translateConfig);
  
  changeLanguage(String lang) {
    translateConfig.preferredLanguage = lang;
  }
  
  clearResources() {
    translateConfig.refresh();
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
    translateConfig.loader = new StaticFileLoader(prefix: '/angular-translate.dart/example/asset/lang-', suffix: '.json');
    translateConfig.addTranslation('en', {
      'BUTTON_LAMG_EN': 'English',
      'BUTTON_LAMG_JA': 'Japanese',
      'BUTTON_CLEAR_RESOURCE': 'Refresh',
      'GREETING': 'Hello',
      'GREET_TO': 'Hello, {{name}}',
      'NAMESPACE': {
        'GREETING': 'How are you?'
      }
    });
    value(TranslateConfig, translateConfig);
  }
}

main() {
  ngBootstrap(module: new TranslateModule()); 
}
