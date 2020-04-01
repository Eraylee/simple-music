import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/song.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/models/search.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:simple_music/widgets/loading_widget.dart';
import 'package:simple_music/widgets/song_widget.dart';

class SongsResultWidget extends StatefulWidget {
  SongsResultWidget(this.keyword);
  final String keyword;
  @override
  SongsResultState createState() => SongsResultState();
}

class SongsResultState extends State<SongsResultWidget> {
  int _page = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      SearchModel searchModel =
          Provider.of<SearchModel>(context, listen: false);
      if (searchModel.result.songs.isEmpty) {
        searchModel.search(widget.keyword, type: SearchType.song);
      }
    });
  }

  EasyRefreshController _controller = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<PlayerModel, SearchModel>(
      builder: (BuildContext context, PlayerModel playerModel,
          SearchModel searchModel, child) {
        if (searchModel.result.songs.isEmpty)
          return Center(
            child: LoadingWidget(),
          );
        return EasyRefresh.custom(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Song song = searchModel.result.songs[index].toSong();
                    return SongWidget(
                        key: UniqueKey(),
                        index: index,
                        onPressed: () => {},
                        song: song,
                        noLeading: true);
                  },
                  childCount: searchModel.result.songs.length,
                ),
              ),
            )
          ],
          controller: _controller,
          onLoad: () async {
            searchModel.search(widget.keyword,
                type: SearchType.song, page: ++_page);
            _controller.finishLoad(
                noMore: searchModel.result.songs.length >=
                    searchModel.result.songCount);
          },
        );
      },
    );
  }
}
