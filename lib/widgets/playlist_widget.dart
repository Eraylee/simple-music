import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/models/player.dart';
import 'package:simple_music/entities/song.dart';
import 'package:simple_music/widgets/icon_button_widget.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';

class PlaylistWidget extends StatelessWidget {
  PlaylistWidget({Key key}) : super(key: key);

  Widget getListItem(BuildContext context,
          {Song song,
          bool isCurrent,
          VoidCallback onPressed,
          VoidCallback onDelete}) =>
      InkWell(
          key: UniqueKey(),
          onTap: onPressed,
          child: Row(children: <Widget>[
            Expanded(
                child: Row(
              children: isCurrent
                  ? <Widget>[
                      Icon(
                        Icons.volume_up,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      EmptyView(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          '${song.name} - ${song.artists}',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]
                  : <Widget>[
                      Expanded(
                        child: Text(
                          '${song.name} - ${song.artists}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
            )),
            IconButtonWidget(
              onPressed: onDelete,
              icon: Icon(
                Icons.close,
                color: Colors.black26,
                size: 20,
              ),
            )
          ]));

  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Consumer<PlayerModel>(
          builder: (context, PlayerModel playerModel, child) => Column(
            children: <Widget>[
              Text(
                '播放列表',
                style: Theme.of(context).textTheme.title,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButtonWidget(
                    icon: Icon(Icons.delete),
                    onPressed: playerModel.clearList,
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemExtent: 42.0,
                  shrinkWrap: true,
                  itemCount: playerModel.playList.length,
                  itemBuilder: (context, i) => Selector<PlayerModel, Song>(
                      selector:
                          (BuildContext context, PlayerModel playerModel) =>
                              playerModel.playList[i],
                      builder: (BuildContext context, Song song, Widget child) {
                        return getListItem(context,
                            song: song,
                            isCurrent: playerModel.currentIndex == i,
                            onPressed: () => playerModel.playSong(song),
                            onDelete: () => playerModel.remove(i));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
