import 'dart:convert' show json;

class Lyric {
  String lyric;
  Duration startTime;
  Duration endTime;
  double offset;

  Lyric(this.lyric, {this.startTime, this.endTime, this.offset});

  @override
  String toString() {
    return 'Lyric{lyric: $lyric, startTime: $startTime, endTime: $endTime}';
  }
}

class LyricData {
  bool sgc;
  bool sfy;
  bool qfy;
  Lrc lrc;
  bool nolyric;
  String msg;
  Klyric klyric;
  Tlyric tlyric;
  int code;

  LyricData(
      {this.sgc,
      this.sfy,
      this.qfy,
      this.lrc,
      this.klyric,
      this.tlyric,
      this.code,
      this.nolyric,
      this.msg});

  factory LyricData.fromJson(jsonRes) => jsonRes == null
      ? null
      : LyricData(
          sgc: jsonRes['sgc'],
          sfy: jsonRes['sfy'],
          qfy: jsonRes['qfy'],
          lrc: Lrc.fromJson(jsonRes['lrc']),
          klyric: Klyric.fromJson(jsonRes['klyric']),
          tlyric: Tlyric.fromJson(jsonRes['tlyric']),
          code: jsonRes['code'],
          msg: jsonRes['msg'],
          nolyric: jsonRes['nolyric']);
  Map<String, dynamic> toJson() => {
        'sgc': sgc,
        'sfy': sfy,
        'qfy': qfy,
        'lrc': lrc,
        'nolyric': nolyric,
        'klyric': klyric,
        'tlyric': tlyric,
        'code': code,
        "msg": msg
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Lrc {
  int version;
  String lyric;

  Lrc({
    this.version,
    this.lyric,
  });

  factory Lrc.fromJson(jsonRes) => jsonRes == null
      ? null
      : Lrc(
          version: jsonRes['version'],
          lyric: jsonRes['lyric'],
        );
  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Klyric {
  int version;
  String lyric;

  Klyric({
    this.version,
    this.lyric,
  });

  factory Klyric.fromJson(jsonRes) => jsonRes == null
      ? null
      : Klyric(
          version: jsonRes['version'],
          lyric: jsonRes['lyric'],
        );
  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Tlyric {
  int version;
  Object lyric;

  Tlyric({
    this.version,
    this.lyric,
  });

  factory Tlyric.fromJson(jsonRes) => jsonRes == null
      ? null
      : Tlyric(
          version: jsonRes['version'],
          lyric: jsonRes['lyric'],
        );
  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
