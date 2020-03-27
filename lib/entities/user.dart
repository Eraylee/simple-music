import 'dart:convert' show json;

class User {
  int loginType;
  int code;
  Account account;
  String msg;
  String token;
  Profile profile;
  List<Bindings> bindings;

  User({
    this.loginType,
    this.code,
    this.account,
    this.msg,
    this.token,
    this.profile,
    this.bindings,
  });

  factory User.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<Bindings> bindings = jsonRes['bindings'] is List ? [] : null;
    if (bindings != null) {
      for (var item in jsonRes['bindings']) {
        if (item != null) {
          bindings.add(Bindings.fromJson(item));
        }
      }
    }

    return User(
      loginType: jsonRes['loginType'],
      code: jsonRes['code'],
      account: Account.fromJson(jsonRes['account']),
      token: jsonRes['token'],
      msg: jsonRes['msg'],
      profile: Profile.fromJson(jsonRes['profile']),
      bindings: bindings,
    );
  }
  Map<String, dynamic> toJson() => {
        'loginType': loginType,
        'code': code,
        'account': account,
        'token': token,
        'msg': msg,
        'profile': profile,
        'bindings': bindings,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Account {
  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  Account({
    this.id,
    this.userName,
    this.type,
    this.status,
    this.whitelistAuthority,
    this.createTime,
    this.salt,
    this.tokenVersion,
    this.ban,
    this.baoyueVersion,
    this.donateVersion,
    this.vipType,
    this.viptypeVersion,
    this.anonimousUser,
  });

  factory Account.fromJson(jsonRes) => jsonRes == null
      ? null
      : Account(
          id: jsonRes['id'],
          userName: jsonRes['userName'],
          type: jsonRes['type'],
          status: jsonRes['status'],
          whitelistAuthority: jsonRes['whitelistAuthority'],
          createTime: jsonRes['createTime'],
          salt: jsonRes['salt'],
          tokenVersion: jsonRes['tokenVersion'],
          ban: jsonRes['ban'],
          baoyueVersion: jsonRes['baoyueVersion'],
          donateVersion: jsonRes['donateVersion'],
          vipType: jsonRes['vipType'],
          viptypeVersion: jsonRes['viptypeVersion'],
          anonimousUser: jsonRes['anonimousUser'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'type': type,
        'status': status,
        'whitelistAuthority': whitelistAuthority,
        'createTime': createTime,
        'salt': salt,
        'tokenVersion': tokenVersion,
        'ban': ban,
        'baoyueVersion': baoyueVersion,
        'donateVersion': donateVersion,
        'vipType': vipType,
        'viptypeVersion': viptypeVersion,
        'anonimousUser': anonimousUser,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Profile {
  String description;
  int userType;
  int province;
  bool defaultAvatar;
  String avatarUrl;
  int djStatus;
  int city;
  int backgroundImgId;
  int gender;
  int accountStatus;
  int birthday;
  int avatarImgId;
  String nickname;
  Object experts;
  bool mutual;
  Object remarkName;
  Object expertTags;
  int authStatus;
  int userId;
  int vipType;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String detailDescription;
  bool followed;
  String backgroundUrl;
  String signature;
  int authority;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile({
    this.description,
    this.userType,
    this.province,
    this.defaultAvatar,
    this.avatarUrl,
    this.djStatus,
    this.city,
    this.backgroundImgId,
    this.gender,
    this.accountStatus,
    this.birthday,
    this.avatarImgId,
    this.nickname,
    this.experts,
    this.mutual,
    this.remarkName,
    this.expertTags,
    this.authStatus,
    this.userId,
    this.vipType,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.detailDescription,
    this.followed,
    this.backgroundUrl,
    this.signature,
    this.authority,
    this.followeds,
    this.follows,
    this.eventCount,
    this.playlistCount,
    this.playlistBeSubscribedCount,
  });

  factory Profile.fromJson(jsonRes) => jsonRes == null
      ? null
      : Profile(
          description: jsonRes['description'],
          userType: jsonRes['userType'],
          province: jsonRes['province'],
          defaultAvatar: jsonRes['defaultAvatar'],
          avatarUrl: jsonRes['avatarUrl'],
          djStatus: jsonRes['djStatus'],
          city: jsonRes['city'],
          backgroundImgId: jsonRes['backgroundImgId'],
          gender: jsonRes['gender'],
          accountStatus: jsonRes['accountStatus'],
          birthday: jsonRes['birthday'],
          avatarImgId: jsonRes['avatarImgId'],
          nickname: jsonRes['nickname'],
          experts: jsonRes['experts'],
          mutual: jsonRes['mutual'],
          remarkName: jsonRes['remarkName'],
          expertTags: jsonRes['expertTags'],
          authStatus: jsonRes['authStatus'],
          userId: jsonRes['userId'],
          vipType: jsonRes['vipType'],
          avatarImgIdStr: jsonRes['avatarImgIdStr'],
          backgroundImgIdStr: jsonRes['backgroundImgIdStr'],
          detailDescription: jsonRes['detailDescription'],
          followed: jsonRes['followed'],
          backgroundUrl: jsonRes['backgroundUrl'],
          signature: jsonRes['signature'],
          authority: jsonRes['authority'],
          followeds: jsonRes['followeds'],
          follows: jsonRes['follows'],
          eventCount: jsonRes['eventCount'],
          playlistCount: jsonRes['playlistCount'],
          playlistBeSubscribedCount: jsonRes['playlistBeSubscribedCount'],
        );
  Map<String, dynamic> toJson() => {
        'description': description,
        'userType': userType,
        'province': province,
        'defaultAvatar': defaultAvatar,
        'avatarUrl': avatarUrl,
        'djStatus': djStatus,
        'city': city,
        'backgroundImgId': backgroundImgId,
        'gender': gender,
        'accountStatus': accountStatus,
        'birthday': birthday,
        'avatarImgId': avatarImgId,
        'nickname': nickname,
        'experts': experts,
        'mutual': mutual,
        'remarkName': remarkName,
        'expertTags': expertTags,
        'authStatus': authStatus,
        'userId': userId,
        'vipType': vipType,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'detailDescription': detailDescription,
        'followed': followed,
        'backgroundUrl': backgroundUrl,
        'signature': signature,
        'authority': authority,
        'followeds': followeds,
        'follows': follows,
        'eventCount': eventCount,
        'playlistCount': playlistCount,
        'playlistBeSubscribedCount': playlistBeSubscribedCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Bindings {
  String url;
  String tokenJsonStr;
  int userId;
  int expiresIn;
  int bindingTime;
  bool expired;
  int refreshTime;
  int id;
  int type;

  Bindings({
    this.url,
    this.tokenJsonStr,
    this.userId,
    this.expiresIn,
    this.bindingTime,
    this.expired,
    this.refreshTime,
    this.id,
    this.type,
  });

  factory Bindings.fromJson(jsonRes) => jsonRes == null
      ? null
      : Bindings(
          url: jsonRes['url'],
          tokenJsonStr: jsonRes['tokenJsonStr'],
          userId: jsonRes['userId'],
          expiresIn: jsonRes['expiresIn'],
          bindingTime: jsonRes['bindingTime'],
          expired: jsonRes['expired'],
          refreshTime: jsonRes['refreshTime'],
          id: jsonRes['id'],
          type: jsonRes['type'],
        );
  Map<String, dynamic> toJson() => {
        'url': url,
        'tokenJsonStr': tokenJsonStr,
        'userId': userId,
        'expiresIn': expiresIn,
        'bindingTime': bindingTime,
        'expired': expired,
        'refreshTime': refreshTime,
        'id': id,
        'type': type,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
