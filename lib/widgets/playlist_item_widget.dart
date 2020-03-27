import 'package:flutter/material.dart';

class PlaylistItemWidget extends StatelessWidget {
  PlaylistItemWidget({
    Key key,
    @required this.title,
    @required this.cover,
    @required this.onPressed,
    @required this.count,
    @required this.playCount,
  }) : super(key: key);
  final String title;
  final String cover;
  final int count;
  final int playCount;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      dense: true,
      contentPadding: EdgeInsets.all(0),
      leading: Image.network(
        '$cover?param=150y150',
        width: 60,
        height: 60,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '$count首，播放$playCount次',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
