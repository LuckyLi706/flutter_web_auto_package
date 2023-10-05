import 'package:flutter_web_auto_package/model/config_save_model.dart';
import 'package:flutter_web_auto_package/network/dio_client.dart';

class DefaultSettingsRequest {
  static const String configSaveUrl = '/config/save';
  static const String configFetchUrl = '/config/fetch';

  static Future<bool> configSaveRequest(ConfigSaveModel configSaveModel,
      {Function(dynamic)? onSuccess, Function(String?)? onFail}) {
    return DioClient.getInstance().doPost(configSaveUrl,
        data: ConfigSaveModel.toMap(configSaveModel),
        onSuccess: onSuccess,
        onFail: onFail);
  }

  static Future<bool> configFetchRequest(
      {Function(dynamic)? onSuccess, Function(String?)? onFail}) {
    return DioClient.getInstance()
        .doGet(configFetchUrl, onSuccess: onSuccess, onFail: onFail);
  }
}
