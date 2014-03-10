part of translate;

class TranslateService {
  TranslateConfig config;
  Interpolate interpolate;

  TranslateService(this.config, this.interpolate);
  
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

    // TODO: should be updated when Interpolation#expressions are released.
    List<String> params = variables.values.map((o) => o.toString()).toList();
    Interpolation interpolation = this.interpolate(message);
    if (interpolation.seperators.length != 1 
        && params.length < interpolation.seperators.length - 1) {
      return "";
    }
    else {
      return interpolation(params);
    }
  }
}
