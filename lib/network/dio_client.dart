import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_web_auto_package/common/widget/comon_loading.dart';
import 'package:flutter_web_auto_package/constants.dart';
import 'package:flutter_web_auto_package/generated/l10n.dart';
import 'package:flutter_web_auto_package/model/base_dio_response.dart';
import 'package:flutter_web_auto_package/util/sp_util.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static late final Dio dio;

  DioClient._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();

    options.connectTimeout = const Duration(seconds: 5);
    options.sendTimeout = const Duration(seconds: 5);
    options.receiveTimeout = const Duration(seconds: 5);
    options.headers = {"Content-Type": "application/json"};

    options.baseUrl = Constants.baseUrl;
    dio = Dio(options);

    ///添加拦截器
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  static DioClient getInstance() {
    return _instance;
  }

  Future<bool> doGet(String path,
      {Function(dynamic)? onSuccess,
      Function(String? failReason)? onFail,
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    showLoading();
    try {
      dio.options.headers['lan'] = SpUtil.getInstance().getLocalIndex();
      Response response = await dio.get(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      if (response.statusCode == 200) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);
        if (baseResponse.code == 1) {
          onSuccess?.call(baseResponse.data ?? baseResponse.message);
          SmartDialog.dismiss();
          return true;
        } else {
          onFail?.call(baseResponse.message);
        }
      } else {
        onFail?.call(handleStatusCode(response));
      }
    } catch (e) {
      if (e is DioException) {
        onFail?.call(handleException(e));
      } else {
        onFail?.call(e.toString());
      }
    }
    SmartDialog.dismiss();
    return false;
  }

  Future<bool> doPost(
    String path, {
    required Function(dynamic)? onSuccess,
    required Function(String? failReason)? onFail,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    showLoading();
    try {
      dio.options.headers['lan'] = SpUtil.getInstance().getLocalIndex();
      Response response = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      if (response.statusCode == 200) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);
        if (baseResponse.code == 1) {
          onSuccess?.call(baseResponse.data ?? baseResponse.message);
          SmartDialog.dismiss();
          return true;
        } else {
          onFail?.call(baseResponse.message);
        }
      } else {
        onFail?.call(handleStatusCode(response));
      }
    } catch (e) {
      if (e is DioException) {
        onFail?.call(handleException(e));
      } else {
        onFail?.call(e.toString());
      }
    }
    SmartDialog.dismiss();
    return false;
  }



  String handleStatusCode(Response response) {
    try {
      int? errCode = response.statusCode;
      switch (errCode) {
        case 400:
          {
            return S.of(Constants.context).request_error;
          }
        case 401:
          {
            return S.of(Constants.context).no_permission;
          }
        case 403:
          {
            return S.of(Constants.context).server_refuse_do;
          }
        case 404:
          {
            return S.of(Constants.context).connect_server_fail;
          }
        case 405:
          {
            return S.of(Constants.context).request_method_prohibited;
          }
        case 500:
          {
            return S.of(Constants.context).server_internal_error;
          }
        case 502:
          {
            return S.of(Constants.context).ineffective_request;
          }
        case 503:
          {
            return S.of(Constants.context).server_die;
          }
        case 505:
          {
            return S.of(Constants.context).not_support_http_request;
          }
        default:
          {
            return response.statusMessage!;
          }
      }
    } on Exception catch (_) {
      return S.of(Constants.context).unknown_error;
    }
  }

  String handleException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        {
          return S.of(Constants.context).request_cancel;
        }
      case DioExceptionType.connectionTimeout:
        {
          return S.of(Constants.context).connect_timeout;
        }
      case DioExceptionType.sendTimeout:
        {
          return S.of(Constants.context).send_timeout;
        }
      case DioExceptionType.receiveTimeout:
        {
          return S.of(Constants.context).receive_timeout;
        }
      case DioExceptionType.badCertificate:
        {
          return S.of(Constants.context).certificate_error;
        }
      case DioExceptionType.connectionError:
        {
          return S.of(Constants.context).connect_error;
        }
      case DioExceptionType.badResponse:
        {
          return error.response == null
              ? S.of(Constants.context).request_error
              : handleStatusCode(error.response!);
        }
      case DioExceptionType.unknown:
        return S.of(Constants.context).unknown_error;
    }
  }
}
