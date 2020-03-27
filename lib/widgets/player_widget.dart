import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:simple_music/models/player.dart';
import 'package:simple_music/widgets/icon_button_widget.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/playlist_widget.dart';

class PlayerWidget extends StatelessWidget {
  PlayerWidget({Key key}) : super(key: key);
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer(builder: (context, PlayerModel playerModel, child) {
        return playerModel.playList.isNotEmpty
            ? GestureDetector(
                onTap: () => NavigatorUtil.goPlayerPage(context),
                child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 1.0), //阴影xy轴偏移量
                            blurRadius: 15.0, //阴影模糊程度
                            spreadRadius: 1.0 //
                            ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          ClipOval(
                            child: Image.network(
                              playerModel.song.picUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          EmptyView(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    playerModel.song.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${playerModel.song.name} - ${playerModel.song.artists}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButtonWidget(
                                onPressed: playerModel.toggle,
                                icon: Icon(
                                  playerModel.playState ==
                                          AudioPlayerState.PLAYING
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_filled,
                                  size: 42,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              EmptyView(
                                width: 8,
                              ),
                              IconButtonWidget(
                                onPressed: () => _onOpenBottomSheet(context),
                                icon: Icon(
                                  Icons.playlist_play,
                                  size: 32,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              )
            : Container();
      }),
    );
  }
}
