import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/icon_button_widget.dart';
import 'package:simple_music/widgets/playlist_widget.dart';

class MusicMenuWidget extends StatelessWidget {
  MusicMenuWidget(this.playerModel);
  final PlayerModel playerModel;

  void _onOpenBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PlaylistWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButtonWidget(
          onPressed: playerModel.toggleLiked,
          icon: Icon(
            playerModel.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: playerModel.isFavorite ? Colors.red : Colors.white,
            size: 32,
          ),
        ),
        IconButtonWidget(
          onPressed: playerModel.changePlayMode,
          icon: Icon(
            playerModel.playMode == PlayMode.repeat
                ? Icons.repeat
                : Icons.repeat_one,
            color: Colors.white,
            size: 32,
          ),
        ),
        IconButtonWidget(
          onPressed: () => _onOpenBottomSheet(context),
          icon: Icon(
            Icons.playlist_play,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
