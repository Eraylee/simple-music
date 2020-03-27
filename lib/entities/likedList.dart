import 'dart:convert' show json;

class LikedListData {
  String msg;
  List<int> ids;
  int checkPoint;
  int code;

  LikedListData({
    this.msg,
    this.ids,
    this.checkPoint,
    this.code,
  });

  factory LikedListData.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<int> ids = jsonRes['ids'] is List ? [] : null;
    if (ids != null) {
      for (var item in jsonRes['ids']) {
        if (item != null) {
          ids.add(item);
        }
      }
    }

    return LikedListData(
      msg: jsonRes['msg'],
      ids: ids,
      checkPoint: jsonRes['checkPoint'],
      code: jsonRes['code'],
    );
  }
  Map<String, dynamic> toJson() => {
        'msg': msg,
        'ids': ids,
        'checkPoint': checkPoint,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
