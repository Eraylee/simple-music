import 'dart:convert' show json;

class Common {
  String msg;
  int code;

  Common({
    this.msg,
    this.code,
  });

  factory Common.fromJson(jsonRes) => jsonRes == null
      ? null
      : Common(
          msg: jsonRes['msg'],
          code: jsonRes['code'],
        );
  Map<String, dynamic> toJson() => {
        'msg': msg,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
