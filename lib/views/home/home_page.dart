import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/entities/song.dart';

import 'package:simple_music/models/home.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/views/home/banner_widget.dart';
import 'package:simple_music/widgets/button_widget.dart';
import 'package:simple_music/widgets/recommend_songs_widget.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      HomeModel homeModel = Provider.of<HomeModel>(context, listen: false);
      homeModel.getBanner();
      if (Provider.of<UserModel>(context, listen: false).user != null) {
        homeModel.getdailySongs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer3<HomeModel, PlayerModel, UserModel>(
        builder: (context, HomeModel homeModel, PlayerModel playerModel,
            UserModel userModel, child) {
          List<Song> songs =
              homeModel.dailySongs.map((v) => v.toSong()).toList();
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BannerWidget(list: homeModel.banners),
              userModel.user != null
                  ? RecommendSongsWidget(
                      title: '每日推荐',
                      onPressed: (int index) =>
                          playerModel.addAndPlay(songs, index),
                      button: SmallOutlineButton(
                        '更多',
                        onPressed: () =>
                            NavigatorUtil.goDailySongDetailPage(context),
                      ),
                      list: songs,
                      currentSong: playerModel.song)
                  : Text(
                      '登录之后获取每日推荐',
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    ),
            ],
          );
        },
      ),
    );
  }
}
