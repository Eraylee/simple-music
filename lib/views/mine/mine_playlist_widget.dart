import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/application.dart';

import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/models/mine.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/loading_widget.dart';
import 'package:simple_music/widgets/playlist_item_widget.dart';

class MinePlaylistWidget extends StatelessWidget {
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
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Theme.of(context).primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Tab(
                        text: '创建',
                      ),
                      Tab(
                        text: '收藏',
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: TabBarView(
                        children: <Widget>[
                          renderList(mineModel.createdList),
                          renderList(mineModel.collectedList),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
