import 'dart:convert' show json;

import 'package:simple_music/entities/song.dart';
import 'package:simple_music/entities/songDetail.dart';

class DailySongs {
  int code;
  String msg;
  List<SongDetail> recommend;

  DailySongs({
    this.code,
    this.msg,
    this.recommend,
  });

  factory DailySongs.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<SongDetail> recommend = jsonRes['recommend'] is List ? [] : null;
    if (recommend != null) {
      for (var item in jsonRes['recommend']) {
        if (item != null) {
          recommend.add(SongDetail.fromJson(item));
        }
      }
    }

    return DailySongs(
      msg: jsonRes['msg'],
      code: jsonRes['code'],
      recommend: recommend,
    );
  }
  Map<String, dynamic> toJson() => {
        'code': code,
        'msg': msg,
        'recommend': recommend,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
