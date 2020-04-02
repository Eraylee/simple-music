import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/models/player.dart';

import 'package:simple_music/models/search.dart';
import 'package:simple_music/views/search/artists_result_widget..dart';
import 'package:simple_music/views/search/playlist_result_widget..dart';
import 'package:simple_music/views/search/songs_result_widget.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/player_widget.dart';
import 'package:simple_music/widgets/search_widget.dart';

List<String> choices = [
  '单曲',
  '歌手',
  '专辑',
];

class SearchDetailPage extends StatefulWidget {
  SearchDetailPage(this.keyword);
  final String keyword;
  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetailPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _controller.text = widget.keyword;
      // Provider.of<SearchModel>(context, listen: false).getHotSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
          appBar: AppBar(
              brightness: Theme.of(context).primaryColorBrightness,
              textTheme: Theme.of(context).primaryTextTheme,
              backgroundColor: Theme.of(context).primaryColor,
              title: Consumer<SearchModel>(
                  builder: (BuildContext context, SearchModel searchModel, _) =>
                      SearchWidget(
                        onSubmitted: (value) {},
                        controller: _controller,
                      )),
              bottom: TabBar(
                tabs: choices.map((v) => Tab(text: v)).toList(),
              )),
          body: SafeArea(
              child: Stack(children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      SongsResultWidget(widget.keyword),
                      ArtistsResultWidget(widget.keyword),
                      PlaylistResultWidget(widget.keyword)
                    ],
                  ),
                ),
                Consumer<PlayerModel>(
                    builder: (context, PlayerModel playerModel, child) =>
                        EmptyView(
                          height: playerModel.playList.isEmpty ? 0 : 52.0,
                        ))
              ],
            ),
            PlayerWidget()
          ]))),
    );
  }
}
