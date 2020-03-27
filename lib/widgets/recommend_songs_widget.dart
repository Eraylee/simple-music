import 'package:flutter/material.dart';

import 'package:simple_music/entities/song.dart';
import 'package:simple_music/widgets/song_widget.dart';

typedef OnSongPressed = Function(int index);

class RecommendSongsWidget extends StatelessWidget {
  RecommendSongsWidget({
    Key key,
    this.title,
    this.list,
    this.button,
    this.currentSong,
    @required this.onPressed,
  }) : super(key: key);
  final String title;
  final List<Song> list;
  final Song currentSong;
  final Widget button;
  final OnSongPressed onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
              button
            ],
          ),
          Divider(),
          Column(
            children: list.asMap().keys.where((k) => k < 3).map((k) {
              final Song song = list[k];
              return SongWidget(
                index: k,
                key: UniqueKey(),
                onPressed: () => onPressed(k),
                song: song,
                isCurrent: song.id == currentSong?.id,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
