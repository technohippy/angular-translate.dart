part of translate;

@NgFilter(name: 'translate')
class TranslateFilter {
  final TranslateService translate;

  TranslateFilter(this.translate);
 
  call(String key, [Map<String, Object> variables]) {
    return this.translate(key, variables == null ? {} : variables);
  }
}