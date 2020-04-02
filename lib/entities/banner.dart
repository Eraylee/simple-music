import 'dart:convert' show json;

import 'package:simple_music/entities/songDetail.dart';

class Banners {
  List<Banner> banners;
  int code;
  String msg;

  Banners({this.banners, this.code, this.msg});

  factory Banners.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Banner> banners = jsonRes['banners'] is List ? [] : null;
    if (banners != null) {
      for (var item in jsonRes['banners']) {
        if (item != null) {
          banners.add(Banner.fromJson(item));
        }
      }
    }

    return Banners(
      msg: jsonRes['msg'],
      banners: banners,
      code: jsonRes['code'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'banners': banners, 'code': code, 'msg': 'msg'};

  @override
  String toString() {
    return json.encode(this);
  }
}

class Banner {
  String pic;
  int targetId;
  String adid;
  int targetType;
  String titleColor;
  String typeTitle;
  String url;
  String adurlV2;
  bool exclusive;
  String monitorImpress;
  String monitorClick;
  String monitorType;
  List<Object> monitorImpressList;
  List<Object> monitorClickList;
  Object monitorBlackList;
  Object extMonitor;
  Object extMonitorInfo;
  Object adSource;
  Object adLocation;
  String encodeId;
  Object program;
  Object event;
  Object video;
  Object dynamicVideoData;
  OrignalSong song;
  String bannerId;
  Object alg;
  String scm;
  String requestId;
  bool showAdTag;
  String pid;
  String showContext;
  String adDispatchJson;

  Banner({
    this.pic,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.adurlV2,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.dynamicVideoData,
    this.song,
    this.bannerId,
    this.alg,
    this.scm,
    this.requestId,
    this.showAdTag,
    this.pid,
    this.showContext,
    this.adDispatchJson,
  });

  factory Banner.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Object> monitorImpressList =
        jsonRes['monitorImpressList'] is List ? [] : null;
    if (monitorImpressList != null) {
      for (var item in jsonRes['monitorImpressList']) {
        if (item != null) {
          monitorImpressList.add(item);
        }
      }
    }

    List<Object> monitorClickList =
        jsonRes['monitorClickList'] is List ? [] : null;
    if (monitorClickList != null) {
      for (var item in jsonRes['monitorClickList']) {
        if (item != null) {
          monitorClickList.add(item);
        }
      }
    }

    return Banner(
      pic: jsonRes['pic'],
      targetId: jsonRes['targetId'],
      adid: jsonRes['adid'],
      targetType: jsonRes['targetType'],
      titleColor: jsonRes['titleColor'],
      typeTitle: jsonRes['typeTitle'],
      url: jsonRes['url'],
      adurlV2: jsonRes['adurlV2'],
      exclusive: jsonRes['exclusive'],
      monitorImpress: jsonRes['monitorImpress'],
      monitorClick: jsonRes['monitorClick'],
      monitorType: jsonRes['monitorType'],
      monitorImpressList: monitorImpressList,
      monitorClickList: monitorClickList,
      monitorBlackList: jsonRes['monitorBlackList'],
      extMonitor: jsonRes['extMonitor'],
      extMonitorInfo: jsonRes['extMonitorInfo'],
      adSource: jsonRes['adSource'],
      adLocation: jsonRes['adLocation'],
      encodeId: jsonRes['encodeId'],
      program: jsonRes['program'],
      event: jsonRes['event'],
      video: jsonRes['video'],
      dynamicVideoData: jsonRes['dynamicVideoData'],
      song: OrignalSong.fromJson(jsonRes['song']),
      bannerId: jsonRes['bannerId'],
      alg: jsonRes['alg'],
      scm: jsonRes['scm'],
      requestId: jsonRes['requestId'],
      showAdTag: jsonRes['showAdTag'],
      pid: jsonRes['pid'],
      showContext: jsonRes['showContext'],
      adDispatchJson: jsonRes['adDispatchJson'],
    );
  }
  Map<String, dynamic> toJson() => {
        'pic': pic,
        'targetId': targetId,
        'adid': adid,
        'targetType': targetType,
        'titleColor': titleColor,
        'typeTitle': typeTitle,
        'url': url,
        'adurlV2': adurlV2,
        'exclusive': exclusive,
        'monitorImpress': monitorImpress,
        'monitorClick': monitorClick,
        'monitorType': monitorType,
        'monitorImpressList': monitorImpressList,
        'monitorClickList': monitorClickList,
        'monitorBlackList': monitorBlackList,
        'extMonitor': extMonitor,
        'extMonitorInfo': extMonitorInfo,
        'adSource': adSource,
        'adLocation': adLocation,
        'encodeId': encodeId,
        'program': program,
        'event': event,
        'video': video,
        'dynamicVideoData': dynamicVideoData,
        'song': song,
        'bannerId': bannerId,
        'alg': alg,
        'scm': scm,
        'requestId': requestId,
        'showAdTag': showAdTag,
        'pid': pid,
        'showContext': showContext,
        'adDispatchJson': adDispatchJson,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
