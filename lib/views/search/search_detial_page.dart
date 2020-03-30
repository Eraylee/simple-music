import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/models/search.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/search_widget.dart';

class Choice {
  const Choice({this.title, this.page});
  final String title;
  final Widget page;
}

List<Choice> choices = <Choice>[
  Choice(title: '综合', page: Container()),
  Choice(title: '单曲', page: Container()),
  Choice(title: '歌手', page: Container()),
  Choice(title: '专辑', page: Container()),
];

class SearchDetailPage extends StatefulWidget {
  SearchDetailPage(this.query);
  final String query;
  @override
  SearchDetailState createState() => SearchDetailState();
}

class SearchDetailState extends State<SearchDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      print(widget.query);
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
                      SearchWidget(onSubmitted: (value) {})),
              bottom: TabBar(
                tabs: choices.map((v) => Tab(text: v.title)).toList(),
              )),
          body: Consumer<SearchModel>(
            builder: (BuildContext context, SearchModel searchModel, _) =>
                SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
          )),
    );
  }
}
