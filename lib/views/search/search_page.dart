import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/models/player.dart';

import 'package:simple_music/models/search.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/views/search/hot_search_list_widget.dart';
import 'package:simple_music/views/search/search_history_widget.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/player_widget.dart';
import 'package:simple_music/widgets/search_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      Provider.of<SearchModel>(context, listen: false).getHotSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Theme.of(context).primaryColorBrightness,
          textTheme: Theme.of(context).primaryTextTheme,
          backgroundColor: Theme.of(context).primaryColor,
          title: Consumer<SearchModel>(
              builder: (BuildContext context, SearchModel searchModel, _) =>
                  SearchWidget(onSubmitted: (value) {
                    searchModel.addSearchHistory(value);
                    NavigatorUtil.goSearchDetailPage(context, value);
                  })),
        ),
        body: Consumer<SearchModel>(
          builder: (BuildContext context, SearchModel searchModel, _) =>
              SafeArea(
                  child: Stack(children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SearchHistoryWidget(searchModel.searchHistory),
                  HotSearchListWidget(searchModel.hotSearchList),
                  Consumer<PlayerModel>(
                      builder: (context, PlayerModel playerModel, child) =>
                          EmptyView(
                            height: playerModel.playList.isEmpty ? 0 : 52.0,
                          ))
                ],
              ),
            ),
            PlayerWidget()
          ])),
        ));
  }
}
