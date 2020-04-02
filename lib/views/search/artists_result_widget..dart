import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/songDetail.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/models/search.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:simple_music/widgets/loading_widget.dart';

class ArtistsResultWidget extends StatefulWidget {
  ArtistsResultWidget(this.keyword);
  final String keyword;
  @override
  _ArtistsResultState createState() => _ArtistsResultState();
}

class _ArtistsResultState extends State<ArtistsResultWidget> {
  int _page = 1;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      SearchModel searchModel =
          Provider.of<SearchModel>(context, listen: false);

      if (searchModel.keyword != widget.keyword ||
          searchModel.result.artists.isEmpty) {
        searchModel.search(widget.keyword, type: SearchType.artist);
      }
    });
  }

  EasyRefreshController _controller = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return Consumer2<PlayerModel, SearchModel>(
      builder: (BuildContext context, PlayerModel playerModel,
          SearchModel searchModel, child) {
        if (searchModel.result.artists.isEmpty)
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
                    Artists artist = searchModel.result.artists[index];
                    return ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: Image.network(
                        '${artist.picUrl}?param=50y50',
                        width: 50.0,
                        height: 50.0,
                      ),
                      title: Text(artist.name),
                    );
                  },
                  childCount: searchModel.result.artists.length,
                ),
              ),
            )
          ],
          controller: _controller,
          onLoad: () async {
            searchModel.search(widget.keyword,
                type: SearchType.artist, page: ++_page);
            _controller.finishLoad(
                noMore: searchModel.result.artists.length >=
                    searchModel.result.songCount);
          },
        );
      },
    );
  }
}
