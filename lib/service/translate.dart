part of translate;

class TranslateService {
  final TranslateConfig config;
  final Interpolate interpolate;
  final Scope scope;

  TranslateService(this.config, this.interpolate, this.scope) {
    this.scope.context['translateConfig'] = this.config;
  }
  
  String call(String keysString, [Map<String, Object> variables = const {}]) {
    if (keysString == null) return "";
    List<String> keys = keysString.split(".");
    String lastKey = keys.removeLast();
    Map<String, Object> resources = this.config.getResources();
    keys.forEach((key) {
      resources = resources[key];
      if (resources == null) return "";
    });
    String message = resources[lastKey];
    if (message == null) return "";

    List<String> params = variables.values.map((o) => o.toString()).toList();
    Interpolation interpolation = this.interpolate(message);
    return interpolation(params);
  }
  
  String filter(String key, [Map<String, Object> variables]) {
    return this(key, variables == null ? {} : variables);    
  }
}
