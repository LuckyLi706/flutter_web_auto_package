class BaseResponse {
  String? message;
  int code;
  dynamic data;

  BaseResponse({required this.data, required this.code, required this.message});

  static BaseResponse fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        data: parseJsonMapToMap(json['data']), code: json['code'], message: json['message']);
  }

  static dynamic parseJsonMapToMap(dynamic data) {
    if (data is Map) {
      return Map.fromEntries(
        data.entries.map(
              (e) => MapEntry(
            e.key,
            parseJsonMapToMap(e.value),
          ),
        ),
      );
    }
    if (data is List) {
      return List.from(
        data.map(
              (e) => parseJsonMapToMap(e),
        ),
      );
    }
    return data;
  }
}
