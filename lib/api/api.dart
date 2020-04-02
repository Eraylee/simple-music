import 'package:simple_music/api/http.dart';
import 'package:simple_music/entities/hotSearch.dart';
import 'package:simple_music/entities/likedList.dart';
import 'package:simple_music/entities/lyric.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/entities/playlistDetial.dart';
import 'package:simple_music/entities/search.dart';
import 'package:simple_music/entities/songDetail.dart';
import 'package:simple_music/entities/user.dart';
import 'package:simple_music/entities/banner.dart';
import 'package:simple_music/entities/common.dart';
import 'package:simple_music/entities/dailySongs.dart';

class SearchType {
  const SearchType._(this.type);

  final int type;

  static const SearchType song = SearchType._(1);
  static const SearchType album = SearchType._(10);
  static const SearchType artist = SearchType._(100);
  static const SearchType playlist = SearchType._(1000);
}

class Api {
  /// 获取轮播图
  static Future<Banners> getBanner() async {
    var res = await Http.get('/banner?type=1');
    return Banners.fromJson(res);
  }

  /// 用手机号登录和密码登录
  static Future<User> loginByPhoneAndPassWord(
      String phone, String password) async {
    var res = await Http.get('/login/cellphone',
        queryParameters: {'phone': phone, 'password': password});
    return User.fromJson(res);
  }

  /// 退出登录
  static Future<Common> logout() async {
    var res = await Http.get('/logout');
    return Common.fromJson(res);
  }

  /// 获取每日推荐
  static Future<DailySongs> getDailySongs() async {
    var res = await Http.get('/recommend/songs');
    return DailySongs.fromJson(res);
  }

  ///获取歌词
  static Future<LyricData> getLyric(int id) async {
    var res = await Http.get('/lyric', queryParameters: {'id': id});
    return LyricData.fromJson(res);
  }

  ///喜欢
  static Future<Common> addLikeList(int id, bool like) async {
    var res = await Http.get('/like', queryParameters: {
      'id': id,
      'like': like,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });
    return Common.fromJson(res);
  }

  ///用户歌单
  static Future<PlaylistData> getUserPlaylist(int uid) async {
    var res = await Http.get('/user/playlist', queryParameters: {'uid': uid});
    return PlaylistData.fromJson(res);
  }

  //歌曲详情
  static Future<SongDetialData> getOrignalSong(List<int> ids) async {
    var res =
        await Http.get('/song/detail', queryParameters: {'ids': ids.join(',')});
    return SongDetialData.fromJson(res);
  }

  //歌单详情
  static Future<PlaylistDetailData> getPlaylistDetail(int id) async {
    var res = await Http.get('/playlist/detail', queryParameters: {'id': id});
    return PlaylistDetailData.fromJson(res);
  }

  //喜欢列表
  static Future<LikedListData> getLikedList(int uid) async {
    var res = await Http.get('/likelist', queryParameters: {'id': uid});
    return LikedListData.fromJson(res);
  }

  //热搜列表
  static Future<HotSearchData> getHotSearchList() async {
    var res = await Http.get('/search/hot/detail');
    return HotSearchData.fromJson(res);
  }

  // 搜索
  static Future<SearchResultData> getSearchResult(String keyword,
      {SearchType type, int limit, int offset}) async {
    var res = await Http.get('/search', queryParameters: {
      'keywords': keyword,
      "type": type.type,
      "limit": limit,
      "offset": offset
    });
    return SearchResultData.fromJson(res);
  }
}
