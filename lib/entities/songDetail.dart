import 'dart:convert' show json;

import 'package:simple_music/entities/song.dart';

class SongDetailData {
  List<SongDetail> songs;
  List<Privileges> privileges;
  int code;

  SongDetailData({
    this.songs,
    this.privileges,
    this.code,
  });

  factory SongDetailData.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<SongDetail> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(SongDetail.fromJson(item));
        }
      }
    }

    List<Privileges> privileges = jsonRes['privileges'] is List ? [] : null;
    if (privileges != null) {
      for (var item in jsonRes['privileges']) {
        if (item != null) {
          privileges.add(Privileges.fromJson(item));
        }
      }
    }

    return SongDetailData(
      songs: songs,
      privileges: privileges,
      code: jsonRes['code'],
    );
  }
  Map<String, dynamic> toJson() => {
        'songs': songs,
        'privileges': privileges,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class SongDetail {
  String name;
  int id;
  int position;
  List<String> alias;
  int status;
  int fee;
  int copyrightId;
  String disc;
  int no;
  List<Artists> artists;
  Album album;
  bool starred;
  int popularity;
  int score;
  int starredNum;
  int duration;
  int playedNum;
  int dayPlays;
  int hearTime;
  String ringtone;
  Object crbt;
  Object audition;
  String copyFrom;
  String commentThreadId;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int copyright;
  Object transName;
  Object sign;
  int mark;
  Object mp3Url;
  Object rurl;
  int mvid;
  BMusic bMusic;
  int rtype;
  HMusic hMusic;
  MMusic mMusic;
  LMusic lMusic;
  bool exclusive;
  Privilege privilege;

  SongDetail({
    this.name,
    this.id,
    this.position,
    this.alias,
    this.status,
    this.fee,
    this.copyrightId,
    this.disc,
    this.no,
    this.artists,
    this.album,
    this.starred,
    this.popularity,
    this.score,
    this.starredNum,
    this.duration,
    this.playedNum,
    this.dayPlays,
    this.hearTime,
    this.ringtone,
    this.crbt,
    this.audition,
    this.copyFrom,
    this.commentThreadId,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.copyright,
    this.transName,
    this.sign,
    this.mark,
    this.mp3Url,
    this.rurl,
    this.mvid,
    this.bMusic,
    this.rtype,
    this.hMusic,
    this.mMusic,
    this.lMusic,
    this.exclusive,
    this.privilege,
  });

  factory SongDetail.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<String> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
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

    return SongDetail(
      name: jsonRes['name'],
      id: jsonRes['id'],
      position: jsonRes['position'],
      alias: alias,
      status: jsonRes['status'],
      fee: jsonRes['fee'],
      copyrightId: jsonRes['copyrightId'],
      disc: jsonRes['disc'],
      no: jsonRes['no'],
      artists: artists,
      album: Album.fromJson(jsonRes['album']),
      starred: jsonRes['starred'],
      popularity: jsonRes['popularity'],
      score: jsonRes['score'],
      starredNum: jsonRes['starredNum'],
      duration: jsonRes['duration'],
      playedNum: jsonRes['playedNum'],
      dayPlays: jsonRes['dayPlays'],
      hearTime: jsonRes['hearTime'],
      ringtone: jsonRes['ringtone'],
      crbt: jsonRes['crbt'],
      audition: jsonRes['audition'],
      copyFrom: jsonRes['copyFrom'],
      commentThreadId: jsonRes['commentThreadId'],
      rtUrl: jsonRes['rtUrl'],
      ftype: jsonRes['ftype'],
      rtUrls: rtUrls,
      copyright: jsonRes['copyright'],
      transName: jsonRes['transName'],
      sign: jsonRes['sign'],
      mark: jsonRes['mark'],
      mp3Url: jsonRes['mp3Url'],
      rurl: jsonRes['rurl'],
      mvid: jsonRes['mvid'],
      bMusic: BMusic.fromJson(jsonRes['bMusic']),
      rtype: jsonRes['rtype'],
      hMusic: HMusic.fromJson(jsonRes['hMusic']),
      mMusic: MMusic.fromJson(jsonRes['mMusic']),
      lMusic: LMusic.fromJson(jsonRes['lMusic']),
      exclusive: jsonRes['exclusive'],
      privilege: Privilege.fromJson(jsonRes['privilege']),
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'position': position,
        'alias': alias,
        'status': status,
        'fee': fee,
        'copyrightId': copyrightId,
        'disc': disc,
        'no': no,
        'artists': artists,
        'album': album,
        'starred': starred,
        'popularity': popularity,
        'score': score,
        'starredNum': starredNum,
        'duration': duration,
        'playedNum': playedNum,
        'dayPlays': dayPlays,
        'hearTime': hearTime,
        'ringtone': ringtone,
        'crbt': crbt,
        'audition': audition,
        'copyFrom': copyFrom,
        'commentThreadId': commentThreadId,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'copyright': copyright,
        'transName': transName,
        'sign': sign,
        'mark': mark,
        'mp3Url': mp3Url,
        'rurl': rurl,
        'mvid': mvid,
        'bMusic': bMusic,
        'rtype': rtype,
        'hMusic': hMusic,
        'mMusic': mMusic,
        'lMusic': lMusic,
        'exclusive': exclusive,
        'privilege': privilege,
      };

  @override
  String toString() {
    return json.encode(this);
  }

  Song toSong() {
    String artistsNames = '';
    if (artists != null) {
      artistsNames = artists.map((v) => v.name).join(',');
    }
    return Song(
        id: id,
        name: name,
        artists: artistsNames,
        album: album?.name,
        mvId: mvid,
        picUrl: album?.picUrl);
  }
}

class Artists {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Object> alias;
  String trans;
  int musicSize;
  int topicPerson;

  Artists({
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
    this.topicPerson,
  });

  factory Artists.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    return Artists(
      name: jsonRes['name'],
      id: jsonRes['id'],
      picId: jsonRes['picId'],
      img1v1Id: jsonRes['img1v1Id'],
      briefDesc: jsonRes['briefDesc'],
      picUrl: jsonRes['picUrl'],
      img1v1Url: jsonRes['img1v1Url'],
      albumSize: jsonRes['albumSize'],
      alias: alias,
      trans: jsonRes['trans'],
      musicSize: jsonRes['musicSize'],
      topicPerson: jsonRes['topicPerson'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'picId': picId,
        'img1v1Id': img1v1Id,
        'briefDesc': briefDesc,
        'picUrl': picUrl,
        'img1v1Url': img1v1Url,
        'albumSize': albumSize,
        'alias': alias,
        'trans': trans,
        'musicSize': musicSize,
        'topicPerson': topicPerson,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Album {
  String name;
  int id;
  String type;
  int size;
  int picId;
  String blurPicUrl;
  int companyId;
  int pic;
  String picUrl;
  int publishTime;
  String description;
  String tags;
  String company;
  String briefDesc;
  Artist artist;
  List<Object> songs;
  List<String> alias;
  int status;
  int copyrightId;
  String commentThreadId;
  List<Artists> artists;
  String subType;
  Object transName;
  int mark;
  String picId_str;

  Album({
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.artists,
    this.subType,
    this.transName,
    this.mark,
    this.picId_str,
  });

  factory Album.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(item);
        }
      }
    }

    List<String> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }

    return Album(
      name: jsonRes['name'],
      id: jsonRes['id'],
      type: jsonRes['type'],
      size: jsonRes['size'],
      picId: jsonRes['picId'],
      blurPicUrl: jsonRes['blurPicUrl'],
      companyId: jsonRes['companyId'],
      pic: jsonRes['pic'],
      picUrl: jsonRes['picUrl'],
      publishTime: jsonRes['publishTime'],
      description: jsonRes['description'],
      tags: jsonRes['tags'],
      company: jsonRes['company'],
      briefDesc: jsonRes['briefDesc'],
      artist: Artist.fromJson(jsonRes['artist']),
      songs: songs,
      alias: alias,
      status: jsonRes['status'],
      copyrightId: jsonRes['copyrightId'],
      commentThreadId: jsonRes['commentThreadId'],
      artists: artists,
      subType: jsonRes['subType'],
      transName: jsonRes['transName'],
      mark: jsonRes['mark'],
      picId_str: jsonRes['picId_str'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'type': type,
        'size': size,
        'picId': picId,
        'blurPicUrl': blurPicUrl,
        'companyId': companyId,
        'pic': pic,
        'picUrl': picUrl,
        'publishTime': publishTime,
        'description': description,
        'tags': tags,
        'company': company,
        'briefDesc': briefDesc,
        'artist': artist,
        'songs': songs,
        'alias': alias,
        'status': status,
        'copyrightId': copyrightId,
        'commentThreadId': commentThreadId,
        'artists': artists,
        'subType': subType,
        'transName': transName,
        'mark': mark,
        'picId_str': picId_str,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Artist {
  String name;
  int id;
  int picId;
  int img1v1Id;
  String briefDesc;
  String picUrl;
  String img1v1Url;
  int albumSize;
  List<Object> alias;
  String trans;
  int musicSize;
  int topicPerson;

  Artist({
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
    this.topicPerson,
  });

  factory Artist.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> alias = jsonRes['alias'] is List ? [] : null;
    if (alias != null) {
      for (var item in jsonRes['alias']) {
        if (item != null) {
          alias.add(item);
        }
      }
    }

    return Artist(
      name: jsonRes['name'],
      id: jsonRes['id'],
      picId: jsonRes['picId'],
      img1v1Id: jsonRes['img1v1Id'],
      briefDesc: jsonRes['briefDesc'],
      picUrl: jsonRes['picUrl'],
      img1v1Url: jsonRes['img1v1Url'],
      albumSize: jsonRes['albumSize'],
      alias: alias,
      trans: jsonRes['trans'],
      musicSize: jsonRes['musicSize'],
      topicPerson: jsonRes['topicPerson'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'picId': picId,
        'img1v1Id': img1v1Id,
        'briefDesc': briefDesc,
        'picUrl': picUrl,
        'img1v1Url': img1v1Url,
        'albumSize': albumSize,
        'alias': alias,
        'trans': trans,
        'musicSize': musicSize,
        'topicPerson': topicPerson,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class BMusic {
  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  BMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory BMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : BMusic(
          name: jsonRes['name'],
          id: jsonRes['id'],
          size: jsonRes['size'],
          extension: jsonRes['extension'],
          sr: jsonRes['sr'],
          dfsId: jsonRes['dfsId'],
          bitrate: jsonRes['bitrate'],
          playTime: jsonRes['playTime'],
          volumeDelta: jsonRes['volumeDelta'],
        );
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'size': size,
        'extension': extension,
        'sr': sr,
        'dfsId': dfsId,
        'bitrate': bitrate,
        'playTime': playTime,
        'volumeDelta': volumeDelta,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class HMusic {
  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  HMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory HMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : HMusic(
          name: jsonRes['name'],
          id: jsonRes['id'],
          size: jsonRes['size'],
          extension: jsonRes['extension'],
          sr: jsonRes['sr'],
          dfsId: jsonRes['dfsId'],
          bitrate: jsonRes['bitrate'],
          playTime: jsonRes['playTime'],
          volumeDelta: jsonRes['volumeDelta'],
        );
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'size': size,
        'extension': extension,
        'sr': sr,
        'dfsId': dfsId,
        'bitrate': bitrate,
        'playTime': playTime,
        'volumeDelta': volumeDelta,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class MMusic {
  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  MMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory MMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : MMusic(
          name: jsonRes['name'],
          id: jsonRes['id'],
          size: jsonRes['size'],
          extension: jsonRes['extension'],
          sr: jsonRes['sr'],
          dfsId: jsonRes['dfsId'],
          bitrate: jsonRes['bitrate'],
          playTime: jsonRes['playTime'],
          volumeDelta: jsonRes['volumeDelta'],
        );
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'size': size,
        'extension': extension,
        'sr': sr,
        'dfsId': dfsId,
        'bitrate': bitrate,
        'playTime': playTime,
        'volumeDelta': volumeDelta,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class LMusic {
  Object name;
  int id;
  int size;
  String extension;
  int sr;
  int dfsId;
  int bitrate;
  int playTime;
  num volumeDelta;

  LMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory LMusic.fromJson(jsonRes) => jsonRes == null
      ? null
      : LMusic(
          name: jsonRes['name'],
          id: jsonRes['id'],
          size: jsonRes['size'],
          extension: jsonRes['extension'],
          sr: jsonRes['sr'],
          dfsId: jsonRes['dfsId'],
          bitrate: jsonRes['bitrate'],
          playTime: jsonRes['playTime'],
          volumeDelta: jsonRes['volumeDelta'],
        );
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'size': size,
        'extension': extension,
        'sr': sr,
        'dfsId': dfsId,
        'bitrate': bitrate,
        'playTime': playTime,
        'volumeDelta': volumeDelta,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Privilege {
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

  Privilege({
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

  factory Privilege.fromJson(jsonRes) => jsonRes == null
      ? null
      : Privilege(
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
  int playMaxbr;
  int downloadMaxbr;

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
    this.playMaxbr,
    this.downloadMaxbr,
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
          playMaxbr: jsonRes['playMaxbr'],
          downloadMaxbr: jsonRes['downloadMaxbr'],
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
        'playMaxbr': playMaxbr,
        'downloadMaxbr': downloadMaxbr,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
