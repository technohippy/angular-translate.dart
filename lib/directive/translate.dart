part of translate;

@NgDirective(
  selector: '[translate]'
)
@NgDirective(
  selector: 'translate'
)
class TranslateDirective {
  final dom.Element element;
  final TranslateService translate;
  final Parser parser;
  final Scope scope;
  final TranslateConfig config;

  TranslateDirective(this.element, this.translate, this.parser, this.scope, this.config) {
    this.scope.watch("translateConfig.preferredLanguage", (lang, _) => _translate());
  }

  _translate() {
    if (!this.element.attributes.containsKey('translate')) {
      this.element.attributes['translate'] = this.element.innerHtml;
    }
    String messageKey = this.element.attributes['translate'];
    String values = this.element.attributes['translate-values'];
    Map<String, Object> variables = {};
    if (values != null) {
      Expression expr = this.parser(values);
      variables = expr.eval({});
    }
    this.element.innerHtml = this.translate(messageKey, variables);
  }
}
