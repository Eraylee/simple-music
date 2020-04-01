import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/dailySongs.dart';
import 'package:simple_music/entities/song.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/widgets/common_detail_header_widget.dart';
import 'package:simple_music/widgets/sliver_future_builder_widget.dart';
import 'package:simple_music/widgets/song_widget.dart';

class DailySongDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonDetailHeaderWidget(
      title: '每日推荐',
      expandedHeight: Application.screen.getHeight(200.0),
      body: SliverFutureBuilderWidget<DailySongs>(
          future: Api.getDailySongs(),
          builder: (BuildContext context, data) {
            return Consumer<PlayerModel>(
              builder: (BuildContext context, PlayerModel playerModel, _) {
                return SliverList(
                  delegate:
                      SliverChildBuilderDelegate((BuildContext context, index) {
                    Song item = data.recommend[index].toSong();

                    return SongWidget(
                      index: index,
                      numLeading: true,
                      onPressed: () => playerModel.addAndPlay(
                          data.recommend.map((v) => v.toSong()).toList(),
                          index),
                      song: item,
                      isCurrent: item.id == playerModel.song?.id,
                    );
                  }, childCount: data.recommend.length),
                );
              },
            );
          }),
    );
  }
}
