import 'package:flutter/material.dart';
import 'package:simple_music/utils/navigator_util.dart';

import 'package:simple_music/views/home/home_page.dart';
import 'package:simple_music/views/container/drawer_widget.dart';
import 'package:simple_music/views/mine/mine_page.dart';
import 'package:simple_music/widgets/player_widget.dart';

class Choice {
  const Choice({this.title, this.page});
  final String title;
  final Widget page;
}

List<Choice> choices = <Choice>[
  Choice(
    title: '发现',
    page: HomePage(),
  ),
  Choice(
    title: '我的',
    page: MinePage(),
  ),
];

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text('Simple Music'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => NavigatorUtil.goSearchPage(context),
            )
          ],
          bottom: TabBar(
            tabs: choices
                .map((Choice choice) => Tab(
                      text: choice.title,
                    ))
                .toList(),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              TabBarView(
                children: choices.map((Choice choice) => choice.page).toList(),
              ),
              PlayerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
