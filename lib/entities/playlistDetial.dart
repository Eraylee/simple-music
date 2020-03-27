import 'dart:convert' show json;

import 'package:simple_music/entities/playlist.dart';

class PlaylistDetailData {
  int code;
  Object relatedVideos;
  Playlist playlist;
  Object urls;
  List<Privileges> privileges;

  PlaylistDetailData({
    this.code,
    this.relatedVideos,
    this.playlist,
    this.urls,
    this.privileges,
  });

  factory PlaylistDetailData.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Privileges> privileges = jsonRes['privileges'] is List ? [] : null;
    if (privileges != null) {
      for (var item in jsonRes['privileges']) {
        if (item != null) {
          privileges.add(Privileges.fromJson(item));
        }
      }
    }

    return PlaylistDetailData(
      code: jsonRes['code'],
      relatedVideos: jsonRes['relatedVideos'],
      playlist: Playlist.fromJson(jsonRes['playlist']),
      urls: jsonRes['urls'],
      privileges: privileges,
    );
  }
  Map<String, dynamic> toJson() => {
        'code': code,
        'relatedVideos': relatedVideos,
        'playlist': playlist,
        'urls': urls,
        'privileges': privileges,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Privileges {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privileges({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
  });

  factory Privileges.fromJson(jsonRes) => jsonRes == null
      ? null
      : Privileges(
          id: jsonRes['id'],
          fee: jsonRes['fee'],
          payed: jsonRes['payed'],
          st: jsonRes['st'],
          pl: jsonRes['pl'],
          dl: jsonRes['dl'],
          sp: jsonRes['sp'],
          cp: jsonRes['cp'],
          subp: jsonRes['subp'],
          cs: jsonRes['cs'],
          maxbr: jsonRes['maxbr'],
          fl: jsonRes['fl'],
          toast: jsonRes['toast'],
          flag: jsonRes['flag'],
          preSell: jsonRes['preSell'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'fee': fee,
        'payed': payed,
        'st': st,
        'pl': pl,
        'dl': dl,
        'sp': sp,
        'cp': cp,
        'subp': subp,
        'cs': cs,
        'maxbr': maxbr,
        'fl': fl,
        'toast': toast,
        'flag': flag,
        'preSell': preSell,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
