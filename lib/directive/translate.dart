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

  TranslateDirective(this.element, this.translate, this.parser) {
    String messageKey = this.element.attributes['translate'];
    if (messageKey == null) {
      messageKey = this.element.innerHtml;
    }
    String values = this.element.attributes['translate-values'];
    Map<String, Object> variables = {};
    if (values != null) {
      Expression expr = this.parser(values);
      variables = expr.eval({});
    }
    this.element.innerHtml = this.translate(messageKey, variables);
  }
}
