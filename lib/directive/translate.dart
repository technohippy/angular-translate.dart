part of translate;

@NgDirective(
  selector: '[translate]'
)
@NgDirective(
  selector: 'translate'
)
class TranslateDirective {
  final dom.Element element;
  final TranslateService translator;

  TranslateDirective(this.element, this.translator) {
    if (this.element.tagName.toLowerCase() == 'translate') {
      this.element.innerHtml = this.translator.translate(this.element.innerHtml);
    }
    else {
      this.element.innerHtml = this.translator.translate(this.element.attributes['translate']);
    }
  }
}
