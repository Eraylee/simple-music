import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/entities/songDetail.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/models/search.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/loading_widget.dart';

class PlaylistResultWidget extends StatefulWidget {
  PlaylistResultWidget(this.keyword);
  final String keyword;
  @override
  _PlaylistResultState createState() => _PlaylistResultState();
}

class _PlaylistResultState extends State<PlaylistResultWidget> {
  int _page = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      SearchModel searchModel =
          Provider.of<SearchModel>(context, listen: false);

      if (searchModel.keyword != widget.keyword ||
          searchModel.result.playlists.isEmpty) {
        searchModel.search(widget.keyword, type: SearchType.playlist);
      }
    });
  }

  EasyRefreshController _controller = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<PlayerModel, SearchModel>(
      builder: (BuildContext context, PlayerModel playerModel,
          SearchModel searchModel, child) {
        if (searchModel.result.playlists.isEmpty)
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
                    Playlist playlist = searchModel.result.playlists[index];
                    return ListTile(
                      onTap: () =>
                          NavigatorUtil.goPlaylistDetailPage(context, playlist),
                      contentPadding: EdgeInsets.all(0),
                      leading: Image.network(
                        '${playlist.coverImgUrl}?param=50y50',
                        width: 50.0,
                        height: 50.0,
                      ),
                      title: Text(playlist.name),
                    );
                  },
                  childCount: searchModel.result.playlists.length,
                ),
              ),
            )
          ],
          controller: _controller,
          onLoad: () async {
            searchModel.search(widget.keyword,
                type: SearchType.playlist, page: ++_page);
            _controller.finishLoad(
                noMore: searchModel.result.playlists.length >=
                    searchModel.result.songCount);
          },
        );
      },
    );
  }
}
