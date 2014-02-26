part of translate;

@NgDirective(
  selector: '[translate-cloak]'
)
class TranslateCloakDirective {
  final dom.Element element;

  TranslateCloakDirective(this.element);
}
