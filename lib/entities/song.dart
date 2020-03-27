import 'dart:convert' show json;

import 'package:simple_music/entities/songDetail.dart';

class Song {
  int id; // 歌曲id
  int mvId; // mvId
  String name; // 歌曲名称
  String artists; // 演唱者
  String album;
  String picUrl;

  Song({this.id, this.mvId, this.name, this.artists, this.album, this.picUrl});

  factory Song.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) return null;

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }

    return Song(
      id: jsonRes['id'],
      name: jsonRes['name'],
      mvId: jsonRes['mvId'],
      artists: jsonRes['artists'],
      album: jsonRes['album'],
      picUrl: jsonRes['picUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artists': artists,
        'mvId': mvId,
        'album': album,
        'picUrl': picUrl,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
