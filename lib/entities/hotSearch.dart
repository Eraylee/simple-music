import 'dart:convert' show json;

class HotSearchData {
  int code;
  List<HotSearch> data;
  String message;
  String msg;

  HotSearchData({
    this.code,
    this.data,
    this.message,
    this.msg
  });

  factory HotSearchData.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<HotSearch> data = jsonRes['data'] is List ? [] : null;
    if (data != null) {
      for (var item in jsonRes['data']) {
        if (item != null) {
          data.add(HotSearch.fromJson(item));
        }
      }
    }

    return HotSearchData(
      code: jsonRes['code'],
      data: data,
      message: jsonRes['message'],
      msg: jsonRes['msg'],
    );
  }
  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'message': message,
        'msg': msg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class HotSearch {
  String searchWord;
  int score;
  String content;
  int source;
  int iconType;
  String iconUrl;
  String url;
  String alg;

  HotSearch({
    this.searchWord,
    this.score,
    this.content,
    this.source,
    this.iconType,
    this.iconUrl,
    this.url,
    this.alg,
  });

  factory HotSearch.fromJson(jsonRes) => jsonRes == null
      ? null
      : HotSearch(
          searchWord: jsonRes['searchWord'],
          score: jsonRes['score'],
          content: jsonRes['content'],
          source: jsonRes['source'],
          iconType: jsonRes['iconType'],
          iconUrl: jsonRes['iconUrl'],
          url: jsonRes['url'],
          alg: jsonRes['alg'],
        );
  Map<String, dynamic> toJson() => {
        'searchWord': searchWord,
        'score': score,
        'content': content,
        'source': source,
        'iconType': iconType,
        'iconUrl': iconUrl,
        'url': url,
        'alg': alg,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
