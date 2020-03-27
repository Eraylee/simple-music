import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/entities/playlistDetial.dart';
import 'package:simple_music/entities/song.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/widgets/common_detail_header_widget.dart';
import 'package:simple_music/widgets/sliver_future_builder_widget.dart';
import 'package:simple_music/widgets/song_widget.dart';

class PlaylistDetailPage extends StatelessWidget {
  PlaylistDetailPage(this.data);
  final Playlist data;
  @override
  Widget build(BuildContext context) {
    return CommonDetailHeaderWidget(
      title: data.name,
      cover: data.coverImgUrl,
      expandedHeight:  Application.screen.getHeight(240.0),
      content: Center(
        child: Image.network(
          data.coverImgUrl,
          width: Application.screen.getWidth(160),
          height: Application.screen.getHeight(160),
        ),
      ),
      body: SliverFutureBuilderWidget<PlaylistDetailData>(
          future: Api.getPlaylistDetail(data.id),
          builder: (BuildContext context, data) {
            return Consumer<PlayerModel>(
              builder: (BuildContext context, PlayerModel playerModel, _) {
                return SliverList(
                  delegate:
                      SliverChildBuilderDelegate((BuildContext context, index) {
                    Song item = data.playlist.tracks[index].toSong();

                    return SongWidget(
                      index: index,
                      numLeading: true,
                      onPressed: () => playerModel.addAndPlay(
                          data.playlist.tracks.map((v) => v.toSong()).toList(),
                          index),
                      song: item,
                      isCurrent: item.id == playerModel.song?.id,
                    );
                  }, childCount: data.playlist.tracks.length),
                );
              },
            );
          }),
    );
  }
}
