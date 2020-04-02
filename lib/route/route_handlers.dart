import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/utils/data_utils.dart';

import 'package:simple_music/views/container/container_page.dart';
import 'package:simple_music/views/dailySong/daily_song_page.dart';
import 'package:simple_music/views/playlistDetail/playlist_detail_page.dart';
import 'package:simple_music/views/search/search_detial_page.dart';
import 'package:simple_music/views/search/search_page.dart';
import 'package:simple_music/views/splash/splash_page.dart';
import 'package:simple_music/views/login/login_page.dart';
import 'package:simple_music/views/player/player_page.dart';

/// 跳转到首页Splash
Handler splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) =>
        SplashPage());

/// 跳转到主页
Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) =>
        ContainerPage());

/// 跳转到登录页
Handler loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) =>
        LoginPage());

/// 跳转到播放器页面
Handler playerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) =>
        PlayerPage());

/// 跳转到歌单详情
Handler playelistDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String data = params['data']?.first;

  return PlaylistDetailPage(Playlist.fromJson(DataUtils.string2map(data)));
});

/// 每日推荐详情
Handler dailySongsDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return DailyOrignalSongPage();
});

/// 搜索
Handler searchHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return SearchPage();
});

/// 搜索详情
Handler searchDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String data = params['data']?.first;
  return SearchDetailPage(DataUtils.fluroCnParamsDecode(data));
});
