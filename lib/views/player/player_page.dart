import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/models/user.dart';

import 'package:simple_music/views/player/album_art_widget.dart';
import 'package:simple_music/views/player/lyric_view.dart';
import 'package:simple_music/views/player/music_control_wiget.dart';
import 'package:simple_music/views/player/music_menu_widget.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/views/player/progress_widget.dart';

class PlayerPage extends StatefulWidget {
  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<PlayerPage> {
  int layerIndex = 0;

  void _handleSwitchIndex(PlayerModel model) {
    if (layerIndex == 0 && model.lyric.isEmpty) {
      model.getLyric();
    }
    setState(() {
      layerIndex = layerIndex == 0 ? 1 : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      int userId =
          Provider.of<UserModel>(context, listen: false).user.profile.userId;
      PlayerModel payerModel = Provider.of<PlayerModel>(context, listen: false);
      if (payerModel.likedList.isEmpty) {
        payerModel.getLikedList(userId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _padding = Application.screen.screenWidth * 0.1;
    return Stack(
      //重叠的Stack Widget，实现重贴
      children: <Widget>[
        // Consumer<PlayerModel>(
        //     builder: (BuildContext context, PlayerModel playerModel, _) =>
        //         Container(
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   fit: BoxFit.cover,
        //                   image: NetworkImage(
        //                     playerModel.song.picUrl ??
        //                         'https://w.wallhaven.cc/full/39/wallhaven-39gogv.jpg',
        //                   ))),
        //         )),
        // BackdropFilter(
        //   filter:
        //       ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0), //图片模糊过滤，横向竖向都设置5.0
        //   child: Container(
        //     color: Colors.black12,
        //     width: double.infinity,
        //     height: double.infinity,
        //   ),
        // ),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Consumer<PlayerModel>(
                builder: (BuildContext context, PlayerModel playerModel, _) =>
                    Column(
                      children: <Widget>[
                        Text(playerModel.song.name),
                        Text(
                          playerModel.song?.artists,
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        )
                      ],
                    )),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Consumer<PlayerModel>(
              builder: (BuildContext context, PlayerModel playerModel, _) =>
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _handleSwitchIndex(playerModel),
                          child: IndexedStack(
                            index: layerIndex,
                            children: <Widget>[
                              Center(
                                child: AlbumArtWidget(
                                  cover: playerModel.song?.picUrl,
                                ),
                              ),
                              LyricView(model: playerModel)
                            ],
                          ),
                        ),
                      ),
                      MusicMenuWidget(playerModel),
                      ProgressWidget(
                        model: playerModel,
                      ),
                      MusicControlWidget(playerModel),
                      EmptyView(
                        height: _padding / 2,
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
