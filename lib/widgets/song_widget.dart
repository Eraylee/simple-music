import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';

import 'package:simple_music/entities/song.dart';
import 'package:simple_music/widgets/icon_button_widget.dart';

class SongWidget extends StatelessWidget {
  SongWidget(
      {Key key,
      this.song,
      @required this.onPressed,
      @required this.index,
      this.isCurrent = false,
      this.noLeading = false,
      this.numLeading = false})
      : super(key: key);
  final Song song;
  final int index;
  final bool isCurrent;
  final bool noLeading;
  final bool numLeading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      dense: true,
      contentPadding: EdgeInsets.all(0),
      leading: noLeading
          ? null
          : numLeading
              ? Container(
                  width: Application.screen.getWidth(32),
                  height: Application.screen.getHeight(32),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              : Image.network(
                  '${song.picUrl}?param=50y50',
                  width: 50,
                  height: 50,
                ),
      title: Text(
        song.name,
        style: TextStyle(fontSize: 16),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${song.album}-${song.artists}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: IconButtonWidget(
        onPressed: onPressed,
        icon: Icon(
          isCurrent ? Icons.volume_up : Icons.play_circle_filled,
          size: 26,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
