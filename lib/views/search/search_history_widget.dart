import 'package:flutter/material.dart';

class SearchHistoryWidget extends StatelessWidget {
  SearchHistoryWidget(this.history);
  final List<String> history;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text('热门搜索'),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Wrap(
              spacing: 8.0, // gap between adjacent chips
              children: history.asMap().keys.map((index) {
                String value = history[index];
                return Chip(label: Text(value));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
