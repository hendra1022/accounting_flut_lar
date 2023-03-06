typedef Parser<T> = T Function(dynamic json);

class BaseResponse<T> {
  T? data;
  T? meta;
  String message;
  int code;

  BaseResponse.fromJsonMap(Map<String, dynamic> map, Parser<T> parser)
      : data = map["data"] != null ? parser(map["data"]) : null,
        message = map["messages"] is String ? map["messages"] : "something_wrong",
        code = map["code"],
        meta = map["meta"] != null ? parser(map["meta"]) : null;
}
