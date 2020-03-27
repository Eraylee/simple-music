import 'dart:convert' show json;

import 'package:simple_music/entities/song.dart';

class PlaylistData {
  bool more;
  List<Playlist> playlist;
  int code;
  String msg;

  PlaylistData({
    this.more,
    this.playlist,
    this.code,
    this.msg,
  });

  factory PlaylistData.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Playlist> playlist = jsonRes['playlist'] is List ? [] : null;
    if (playlist != null) {
      for (var item in jsonRes['playlist']) {
        if (item != null) {
          playlist.add(Playlist.fromJson(item));
        }
      }
    }

    return PlaylistData(
      more: jsonRes['more'],
      playlist: playlist,
      code: jsonRes['code'],
      msg: jsonRes['msg'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'more': more, 'playlist': playlist, 'code': code, 'msg': msg};

  @override
  String toString() {
    return json.encode(this);
  }
}

class Playlist {
  List<Object> subscribers;
  bool subscribed;
  Creator creator;
  List<Tracks> tracks;
  List<TrackIds> trackIds;
  Object updateFrequency;
  int backgroundCoverId;
  Object backgroundCoverUrl;
  int titleImage;
  Object titleImageUrl;
  Object englishTitle;
  bool opRecommend;
  int adType;
  int trackNumberUpdateTime;
  int subscribedCount;
  int cloudTrackCount;
  int createTime;
  bool highQuality;
  int userId;
  int updateTime;
  int coverImgId;
  bool newImported;
  int specialType;
  String coverImgUrl;
  int trackCount;
  String commentThreadId;
  int privacy;
  int trackUpdateTime;
  int playCount;
  List<Object> tags;
  bool ordered;
  Object description;
  int status;
  String name;
  int id;
  int shareCount;
  int commentCount;

  Playlist({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.tracks,
    this.trackIds,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.adType,
    this.trackNumberUpdateTime,
    this.subscribedCount,
    this.cloudTrackCount,
    this.createTime,
    this.highQuality,
    this.userId,
    this.updateTime,
    this.coverImgId,
    this.newImported,
    this.specialType,
    this.coverImgUrl,
    this.trackCount,
    this.commentThreadId,
    this.privacy,
    this.trackUpdateTime,
    this.playCount,
    this.tags,
    this.ordered,
    this.description,
    this.status,
    this.name,
    this.id,
    this.shareCount,
    this.commentCount,
  });

  factory Playlist.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> subscribers = jsonRes['subscribers'] is List ? [] : null;
    if (subscribers != null) {
      for (var item in jsonRes['subscribers']) {
        if (item != null) {
          subscribers.add(item);
        }
      }
    }

    List<Tracks> tracks = jsonRes['tracks'] is List ? [] : null;
    if (tracks != null) {
      for (var item in jsonRes['tracks']) {
        if (item != null) {
          tracks.add(Tracks.fromJson(item));
        }
      }
    }

    List<TrackIds> trackIds = jsonRes['trackIds'] is List ? [] : null;
    if (trackIds != null) {
      for (var item in jsonRes['trackIds']) {
        if (item != null) {
          trackIds.add(TrackIds.fromJson(item));
        }
      }
    }

    List<Object> tags = jsonRes['tags'] is List ? [] : null;
    if (tags != null) {
      for (var item in jsonRes['tags']) {
        if (item != null) {
          tags.add(item);
        }
      }
    }

    return Playlist(
      subscribers: subscribers,
      subscribed: jsonRes['subscribed'],
      creator: Creator.fromJson(jsonRes['creator']),
      tracks: tracks,
      trackIds: trackIds,
      updateFrequency: jsonRes['updateFrequency'],
      backgroundCoverId: jsonRes['backgroundCoverId'],
      backgroundCoverUrl: jsonRes['backgroundCoverUrl'],
      titleImage: jsonRes['titleImage'],
      titleImageUrl: jsonRes['titleImageUrl'],
      englishTitle: jsonRes['englishTitle'],
      opRecommend: jsonRes['opRecommend'],
      adType: jsonRes['adType'],
      trackNumberUpdateTime: jsonRes['trackNumberUpdateTime'],
      subscribedCount: jsonRes['subscribedCount'],
      cloudTrackCount: jsonRes['cloudTrackCount'],
      createTime: jsonRes['createTime'],
      highQuality: jsonRes['highQuality'],
      userId: jsonRes['userId'],
      updateTime: jsonRes['updateTime'],
      coverImgId: jsonRes['coverImgId'],
      newImported: jsonRes['newImported'],
      specialType: jsonRes['specialType'],
      coverImgUrl: jsonRes['coverImgUrl'],
      trackCount: jsonRes['trackCount'],
      commentThreadId: jsonRes['commentThreadId'],
      privacy: jsonRes['privacy'],
      trackUpdateTime: jsonRes['trackUpdateTime'],
      playCount: jsonRes['playCount'],
      tags: tags,
      ordered: jsonRes['ordered'],
      description: jsonRes['description'],
      status: jsonRes['status'],
      name: jsonRes['name'],
      id: jsonRes['id'],
      shareCount: jsonRes['shareCount'],
      commentCount: jsonRes['commentCount'],
    );
  }
  Map<String, dynamic> toJson() => {
        'subscribers': subscribers,
        'subscribed': subscribed,
        'creator': creator,
        'tracks': tracks,
        'trackIds': trackIds,
        'updateFrequency': updateFrequency,
        'backgroundCoverId': backgroundCoverId,
        'backgroundCoverUrl': backgroundCoverUrl,
        'titleImage': titleImage,
        'titleImageUrl': titleImageUrl,
        'englishTitle': englishTitle,
        'opRecommend': opRecommend,
        'adType': adType,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'subscribedCount': subscribedCount,
        'cloudTrackCount': cloudTrackCount,
        'createTime': createTime,
        'highQuality': highQuality,
        'userId': userId,
        'updateTime': updateTime,
        'coverImgId': coverImgId,
        'newImported': newImported,
        'specialType': specialType,
        'coverImgUrl': coverImgUrl,
        'trackCount': trackCount,
        'commentThreadId': commentThreadId,
        'privacy': privacy,
        'trackUpdateTime': trackUpdateTime,
        'playCount': playCount,
        'tags': tags,
        'ordered': ordered,
        'description': description,
        'status': status,
        'name': name,
        'id': id,
        'shareCount': shareCount,
        'commentCount': commentCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tracks {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<Object> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Object crbt;
  String cf;
  Al al;
  int dt;
  H h;
  M m;
  L l;
  Object a;
  String cd;
  int no;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int djId;
  int copyright;
  int s_id;
  int mark;
  int mst;
  int cp;
  int mv;
  int rtype;
  Object rurl;
  int publishTime;

  Tracks({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.s_id,
    this.mark,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
  });

  factory Tracks.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Ar> ar = jsonRes['ar'] is List ? [] : null;
    if (ar != null) {
      for (var item in jsonRes['ar']) {
        if (item != null) {
          ar.add(Ar.fromJson(item));
        }
      }
    }

    List<Object> alia = jsonRes['alia'] is List ? [] : null;
    if (alia != null) {
      for (var item in jsonRes['alia']) {
        if (item != null) {
          alia.add(item);
        }
      }
    }

    List<Object> rtUrls = jsonRes['rtUrls'] is List ? [] : null;
    if (rtUrls != null) {
      for (var item in jsonRes['rtUrls']) {
        if (item != null) {
          rtUrls.add(item);
        }
      }
    }

    return Tracks(
      name: jsonRes['name'],
      id: jsonRes['id'],
      pst: jsonRes['pst'],
      t: jsonRes['t'],
      ar: ar,
      alia: alia,
      pop: jsonRes['pop'],
      st: jsonRes['st'],
      rt: jsonRes['rt'],
      fee: jsonRes['fee'],
      v: jsonRes['v'],
      crbt: jsonRes['crbt'],
      cf: jsonRes['cf'],
      al: Al.fromJson(jsonRes['al']),
      dt: jsonRes['dt'],
      h: H.fromJson(jsonRes['h']),
      m: M.fromJson(jsonRes['m']),
      l: L.fromJson(jsonRes['l']),
      a: jsonRes['a'],
      cd: jsonRes['cd'],
      no: jsonRes['no'],
      rtUrl: jsonRes['rtUrl'],
      ftype: jsonRes['ftype'],
      rtUrls: rtUrls,
      djId: jsonRes['djId'],
      copyright: jsonRes['copyright'],
      s_id: jsonRes['s_id'],
      mark: jsonRes['mark'],
      mst: jsonRes['mst'],
      cp: jsonRes['cp'],
      mv: jsonRes['mv'],
      rtype: jsonRes['rtype'],
      rurl: jsonRes['rurl'],
      publishTime: jsonRes['publishTime'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'pst': pst,
        't': t,
        'ar': ar,
        'alia': alia,
        'pop': pop,
        'st': st,
        'rt': rt,
        'fee': fee,
        'v': v,
        'crbt': crbt,
        'cf': cf,
        'al': al,
        'dt': dt,
        'h': h,
        'm': m,
        'l': l,
        'a': a,
        'cd': cd,
        'no': no,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'djId': djId,
        'copyright': copyright,
        's_id': s_id,
        'mark': mark,
        'mst': mst,
        'cp': cp,
        'mv': mv,
        'rtype': rtype,
        'rurl': rurl,
        'publishTime': publishTime,
      };

  @override
  String toString() {
    return json.encode(this);
  }

  Song toSong() {
    String artistsNames = '';
    if (ar != null) {
      artistsNames = ar.map((v) => v.name).join(',');
    }
    return Song(
        id: id,
        name: name,
        artists: artistsNames,
        album: al?.name,
        mvId: mv,
        picUrl: al?.picUrl);
  }
}

class Ar {
  int id;
  String name;
  List<Object> tns;
  List<Object> alias;

  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
  });

  factory Ar.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }

    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    return Ar(
      id: jsonRes['id'],
      name: jsonRes['name'],
      tns: tns,
      alias: alias,
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tns': tns,
        'alias': alias,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Al {
  int id;
  String name;
  String picUrl;
  List<Object> tns;
  int pic;

  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.pic,
  });

  factory Al.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> tns = jsonRes['tns'] is List ? [] : null;
    if (tns != null) {
      for (var item in jsonRes['tns']) {
        if (item != null) {
          tns.add(item);
        }
      }
    }

    return Al(
      id: jsonRes['id'],
      name: jsonRes['name'],
      picUrl: jsonRes['picUrl'],
      tns: tns,
      pic: jsonRes['pic'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'picUrl': picUrl,
        'tns': tns,
        'pic': pic,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class H {
  int br;
  int fid;
  int size;
  num vd;

  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory H.fromJson(jsonRes) => jsonRes == null
      ? null
      : H(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );
  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class M {
  int br;
  int fid;
  int size;
  num vd;

  M({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory M.fromJson(jsonRes) => jsonRes == null
      ? null
      : M(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );
  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class L {
  int br;
  int fid;
  int size;
  num vd;

  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  factory L.fromJson(jsonRes) => jsonRes == null
      ? null
      : L(
          br: jsonRes['br'],
          fid: jsonRes['fid'],
          size: jsonRes['size'],
          vd: jsonRes['vd'],
        );
  Map<String, dynamic> toJson() => {
        'br': br,
        'fid': fid,
        'size': size,
        'vd': vd,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class TrackIds {
  int id;
  int v;
  Object alg;

  TrackIds({
    this.id,
    this.v,
    this.alg,
  });

  factory TrackIds.fromJson(jsonRes) => jsonRes == null
      ? null
      : TrackIds(
          id: jsonRes['id'],
          v: jsonRes['v'],
          alg: jsonRes['alg'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'v': v,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  Object expertTags;
  Object experts;
  int djStatus;
  int vipType;
  Object remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String avatarImgId_str;

  Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.avatarImgId_str,
  });

  factory Creator.fromJson(jsonRes) => jsonRes == null
      ? null
      : Creator(
          defaultAvatar: jsonRes['defaultAvatar'],
          province: jsonRes['province'],
          authStatus: jsonRes['authStatus'],
          followed: jsonRes['followed'],
          avatarUrl: jsonRes['avatarUrl'],
          accountStatus: jsonRes['accountStatus'],
          gender: jsonRes['gender'],
          city: jsonRes['city'],
          birthday: jsonRes['birthday'],
          userId: jsonRes['userId'],
          userType: jsonRes['userType'],
          nickname: jsonRes['nickname'],
          signature: jsonRes['signature'],
          description: jsonRes['description'],
          detailDescription: jsonRes['detailDescription'],
          avatarImgId: jsonRes['avatarImgId'],
          backgroundImgId: jsonRes['backgroundImgId'],
          backgroundUrl: jsonRes['backgroundUrl'],
          authority: jsonRes['authority'],
          mutual: jsonRes['mutual'],
          expertTags: jsonRes['expertTags'],
          experts: jsonRes['experts'],
          djStatus: jsonRes['djStatus'],
          vipType: jsonRes['vipType'],
          remarkName: jsonRes['remarkName'],
          avatarImgIdStr: jsonRes['avatarImgIdStr'],
          backgroundImgIdStr: jsonRes['backgroundImgIdStr'],
          avatarImgId_str: jsonRes['avatarImgId_str'],
        );
  Map<String, dynamic> toJson() => {
        'defaultAvatar': defaultAvatar,
        'province': province,
        'authStatus': authStatus,
        'followed': followed,
        'avatarUrl': avatarUrl,
        'accountStatus': accountStatus,
        'gender': gender,
        'city': city,
        'birthday': birthday,
        'userId': userId,
        'userType': userType,
        'nickname': nickname,
        'signature': signature,
        'description': description,
        'detailDescription': detailDescription,
        'avatarImgId': avatarImgId,
        'backgroundImgId': backgroundImgId,
        'backgroundUrl': backgroundUrl,
        'authority': authority,
        'mutual': mutual,
        'expertTags': expertTags,
        'experts': experts,
        'djStatus': djStatus,
        'vipType': vipType,
        'remarkName': remarkName,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'avatarImgId_str': avatarImgId_str,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
