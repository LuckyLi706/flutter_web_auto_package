class ConfigSaveModel {
  String sourceCodePath = '';
  String scriptCodePath = '';
  String flavors = '';
  String environments = '';

  static Map<String, String> toMap(ConfigSaveModel configSaveModel) {
    return {
      'sourceCodePath': configSaveModel.sourceCodePath,
      'scriptCodePath': configSaveModel.scriptCodePath,
      'flavors': configSaveModel.flavors,
      'environments': configSaveModel.environments
    };
  }

  static ConfigSaveModel toModel(Map<dynamic, dynamic> map) {
    ConfigSaveModel configSaveModel = ConfigSaveModel();
    configSaveModel.sourceCodePath = map['sourceCodePath'] ?? '';
    configSaveModel.scriptCodePath = map['scriptCodePath'] ?? '';
    configSaveModel.flavors = map['flavors'] ?? '';
    configSaveModel.environments = map['environments'] ?? '';
    return configSaveModel;
  }
}
