angular-translate.dart
======================

This project has only just begun.

How to Use
----------

'''dart
var translator = new TranslateConfig('ja');
translator.addTranslation('en', {
  'greeting': 'Hello'
});
translator.addTranslation('ja', {
  'greeting': 'こんにちは'
});

ngBootStrap(new Module()..value(TranslateConfig, translator));
'''

'''html
<h1>Translate</h1>

<p>{{'greeting' | translate}}</p>
<p><translate>greeting</translate></p>
<p translate="greeting" />
'''

Ref.
----

- [angular-translate](http://pascalprecht.github.io/angular-translate/)
