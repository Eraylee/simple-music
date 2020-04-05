import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/models/mine.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/views/mine/mine_header_widget.dart';
import 'package:simple_music/views/mine/mine_playlist_widget.dart';

class MinePage extends StatefulWidget {
  @override
  MineState createState() => MineState();
}

class MineState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      MineModel mineModel = Provider.of<MineModel>(context, listen: false);
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      if (userModel.user != null) {
        mineModel.getPlaylist(userModel.user.profile.userId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MineHeaderWidget(),
        Expanded(
          child: MinePlaylistWidget(),
        ),
      ],
    );
  }
}
