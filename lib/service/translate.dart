part of translate;

class TranslateService {
  TranslateConfig config;
  Interpolate interpolate;

  TranslateService(this.config, this.interpolate);
  
  String call(String key, [Map<String, Object> variables = const {}]) {
    String message = this.config.getResources()[key];
    // TODO: should be updated when Interpolation#expressions are released.
    List<String> params = variables.values.map((o) => o.toString()).toList();
    Interpolation interpolation = this.interpolate(message);
    if (interpolation.seperators.length != 1 
        && params.length < interpolation.seperators.length - 1) {
      return '';
    }
    else {
      return interpolation(params);
    }
  }
}
