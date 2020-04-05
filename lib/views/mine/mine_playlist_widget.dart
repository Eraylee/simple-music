import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/models/mine.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/loading_widget.dart';
import 'package:simple_music/widgets/playlist_item_widget.dart';

List<String> tabs = ['我创建的', '我收藏的'];

class MinePlaylistWidget extends StatefulWidget {
  @override
  _MinePlaylistState createState() => _MinePlaylistState();
}

class _MinePlaylistState extends State<MinePlaylistWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: tabs.length);
    _controller.addListener(_handleChangeIndex);
  }

  void _handleChangeIndex() {
    setState(() {
      _currentIndex = _controller.index;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.removeListener(_handleChangeIndex);
    _controller.dispose();
  }

  Widget renderList(List<Playlist> list) => ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        Playlist item = list[index];
        return PlaylistItemWidget(
          key: UniqueKey(),
          onPressed: () => NavigatorUtil.goPlaylistDetailPage(context, item),
          cover: item.coverImgUrl,
          count: item.trackCount,
          playCount: item.playCount,
          title: item.name,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Consumer2<MineModel, UserModel>(builder:
        (BuildContext context, MineModel mineModel, UserModel userModel, _) {
      if (userModel.user == null)
        return Text(
          '登录之后获取每日推荐',
          style: TextStyle(fontSize: 16, color: Colors.black45),
        );
      if (mineModel.loading) return LoadingWidget();

      return Column(
        children: <Widget>[
          Row(
              children: tabs.asMap().keys.map(
            (int index) {
              String value = tabs[index];
              return FlatButton(
                child: Text(value,
                    style: TextStyle(
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.black54,
                        fontSize: 12.0)),
                onPressed: () {
                  setState(() {
                    _currentIndex = index;
                  });
                  _controller.index = index;
                },
              );
            },
          ).toList()),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TabBarView(
                controller: _controller,
                children: <Widget>[
                  renderList(mineModel.createdList),
                  renderList(mineModel.collectedList),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
