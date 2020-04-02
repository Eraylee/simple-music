import 'package:flutter/material.dart';

import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/banner.dart' as MyBanner;
import 'package:simple_music/entities/dailySongs.dart';
import 'package:simple_music/entities/songDetail.dart';
import 'package:simple_music/utils/utils..dart';

class HomeModel with ChangeNotifier {
  List<MyBanner.Banner> _banners = [];
  List<OrignalSong> _dailySongs = [];
  List<MyBanner.Banner> get banners => _banners;
  List<OrignalSong> get dailySongs => _dailySongs;

  /// 获取首页轮播图
  void getBanner() async {
    try {
      MyBanner.Banners res = await Api.getBanner();
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '获取轮播图失败');
        return null;
      }
      _banners = res.banners;
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }

  void getdailySongs() async {
    DailySongs res = await Api.getDailySongs();
    if (res.code > 299) {
      Utils.showToast(res.msg ?? '获取轮播图失败');
      return null;
    }

    _dailySongs = res.recommend;
    notifyListeners();
  }
}
