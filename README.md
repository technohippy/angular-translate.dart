angular-translate.dart
======================

How to Use
----------

*Configure*

```dart
var translations = new TranslateConfig('ja-JP');
translations.addTranslation('en', {
  'GREETING': 'Hello',
  'GREET_TO': 'Hello, {{name}}',
  'NAMESPACE': {
    'GREETING': 'How are you?'
  }
});
translations.addTranslation('ja', {
  'GREETING': 'こんにちは',
  'GREET_TO': 'こんにちは、{{name}}さん',
  'NAMESPACE': {
    'GREETING': '元気？'
  }
});

ngBootStrap(new Module()..value(TranslateConfig, translations));
```

*Use in Codes*

```dart
@NgController{ /* ... */ }
class YourController {
  YourController(TranslateService translate) {
    String translated = translate('GREETING');
    String translatedWithVars = translate('GREET_TO', {'name':'Ando'});
    String translatedWithNamespace = translate('NAMESPACE.GREETING');
  }
}
```

*Use in Templates*

```html
<h2>Basic</h2>
<p>{{'GREETING' | translate}}</p>
<p><translate>GREETING</translate></p>
<p translate="GREETING" />

<h2>Variable Replacement</h2>
<p>{{'GREET_TO' | translate: {'name':'Ando'} }}</p>
<p><translate translate-values="{'name':'Ando'}">GREET_TO</translate></p>
<p translate="GREET_TO" translate-values="{'name':'Ando'}" />

<h2>Namespace</h2>
<p>{{'NAMESPACE.GREETING' | translate}}</p>
<p><translate>NAMESPACE.GREETING</translate></p>
<p translate="NAMESPACE.GREETING" />
```


Reference
---------

- [angular-translate](http://pascalprecht.github.io/angular-translate/)
