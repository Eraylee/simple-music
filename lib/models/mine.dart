import 'package:flutter/material.dart';

import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/utils/utils..dart';

class MineModel with ChangeNotifier {
  List<Playlist> _createdList = [];
  List<Playlist> _collectedList = [];
  bool _loading = true;
  bool get loading => _loading;
  List<Playlist> get createdList => _createdList;
  List<Playlist> get collectedList => _collectedList;

  void getPlaylist(int uid) async {
    try {
      PlaylistData res = await Api.getUserPlaylist(uid);
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '获取歌单失败');
        return;
      }
      _createdList =
          res.playlist.where((v) => v.creator.userId == uid).toList();
      _collectedList =
          res.playlist.where((v) => v.creator.userId != uid).toList();
      _loading = false;
      notifyListeners();
    } catch (e) {
      print('${e.toString()}');
    }
  }
  
}
