import 'package:flutter/material.dart';

import 'package:simple_music/application.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/entities/song.dart';
import 'package:simple_music/route/routes.dart';
import 'package:simple_music/utils/data_utils.dart';

class NavigatorUtil {
  /// 跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.home, replace: true);
  }

  /// 登录页
  static void goLoginPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.login);
  }

  /// 播放器
  static void goPlayerPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.player);
  }

  /// 歌单详情
  static void goPlaylistDetailPage(BuildContext context, Playlist data) {
    Application.router.navigateTo(context,
        '${Routes.playlistDeital}?data=${DataUtils.object2string(data)}');
  }

  /// 每日推荐详情
  static void goDailySongDetailPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.dailySongDetail);
  }

  /// 搜索页
  static void goSearchPage(BuildContext context) {
    Application.router.navigateTo(context, Routes.search);
  }
}
