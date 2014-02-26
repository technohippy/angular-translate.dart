part of translate;

@NgFilter(name: 'translate')
class TranslateFilter {
  TranslateService translator;

  TranslateFilter(this.translator);

  call(String key) {
    return this.translator.translate(key);
  }
}
