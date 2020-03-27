import 'package:flutter/material.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/icon_button_widget.dart';

class MusicControlWidget extends StatelessWidget {
  MusicControlWidget(this.playerModel);
  final PlayerModel playerModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButtonWidget(
          onPressed: playerModel.playPrev,
          icon: Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 50,
          ),
        ),
        EmptyView(
          width: 12.0,
        ),
        IconButtonWidget(
          onPressed: playerModel.toggle,
          icon: Icon(
            playerModel.playState == AudioPlayerState.PLAYING
                ? Icons.pause
                : Icons.play_arrow,
            color: Colors.white,
            size: 50,
          ),
        ),
        EmptyView(
          width: 12.0,
        ),
        IconButtonWidget(
          onPressed: playerModel.playNext,
          icon: Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 50,
          ),
        ),
      ],
    );
  }
}
