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

    Interpolation interpolation = this.interpolate(message);
    var params = new List<String>();
    for (String name in interpolation.expressions) {
      params.add(variables[name]);
    }
    return interpolation(params);
  }
  
  String filter(String key, [Map<String, Object> variables]) {
    return this(key, variables == null ? {} : variables);    
  }
}
