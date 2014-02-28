part of translate;

@NgFilter(name: 'translate')
class TranslateFilter {
  TranslateService translate;

  TranslateFilter(this.translate);

  call(String key, [Map<String, Object> variables = const {}]) {
    return this.translate(key, variables);
  }
}
