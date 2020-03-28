import 'package:flutter/material.dart';

import 'package:simple_music/entities/hotSearch.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';
import 'package:simple_music/widgets/loading_widget.dart';

class SearchHistoryWidget extends StatelessWidget {
  SearchHistoryWidget(this.history);
  final List<String> history;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: <Widget>[
          Text('热门搜索'),
          Divider(),
          Wrap(
            children: history.asMap().keys.map((index) {
              String value = history[index];
              return Chip(label: Text(value));
            }).toList(),
          )
        ],
      ),
    );
  }
}
