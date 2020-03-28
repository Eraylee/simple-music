import 'package:flutter/material.dart';

import 'package:simple_music/entities/hotSearch.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/loading_widget.dart';

class HotSearchListWidget extends StatelessWidget {
  HotSearchListWidget(this.hotSearch);
  final List<HotSearch> hotSearch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: <Widget>[
          Text('热门搜索'),
          Divider(),
          hotSearch.isEmpty
              ? Center(
                  child: LoadingWidget(),
                )
              : ListView.builder(
                  itemCount: hotSearch.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    HotSearch item = hotSearch[i];
                    return ListTile(
                      leading: Container(
                        child: Center(
                          child: Text((i + 1).toString()),
                        ),
                        width: 40,
                      ),
                      title: Row(
                        children: <Widget>[
                          Text(item.searchWord),
                          EmptyView(
                            width: 8,
                          ),
                          item.iconUrl != null
                              ? Image.network(
                                  item.iconUrl,
                                  width: 24.0,
                                )
                              : Container()
                        ],
                      ),
                      trailing: Text(
                        item.score.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.black26),
                      ),
                      subtitle: Text(
                        item.content,
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    );
                  },
                )
        ],
      ),
    );
  }
}
