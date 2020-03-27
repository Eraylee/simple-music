import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simple_music/models/player.dart';
import 'package:flustars/flustars.dart';

import 'package:simple_music/widgets/empty_view_widget.dart';

class ProgressWidget extends StatelessWidget {
  ProgressWidget({Key key, this.model}) : super(key: key);
  final PlayerModel model;

  Widget renderChild(
      {double currentTime,
      double songDuration,
      String currentTimeStr,
      String songDurationStr}) {
    return Row(
      children: <Widget>[
        EmptyView(
          width: 16,
        ),
        Text(
          currentTimeStr,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Expanded(
          child: Slider(
            value: currentTime,
            max: songDuration,
            min: 0.0,
            onChanged: (val) => model.changeProgress(val.toInt()),
            onChangeStart: (_) => model.pause(),
            onChangeEnd: (val) => model.seek(val.toInt()),
            activeColor: Colors.white,
            inactiveColor: Colors.white30,
          ),
        ),
        Text(
          songDurationStr,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        EmptyView(
          width: 16,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
        stream: model.songPosition,
        builder: (context, snapshot) {
          double currentTime = snapshot.data?.inMilliseconds?.toDouble() ?? 0;
          double songDuration =
              model.songDuration?.inMilliseconds?.toDouble() ?? 0;
          String currentTimeStr =
              DateUtil.formatDateMs(currentTime.toInt(), format: "mm:ss");
          String songDurationStr =
              DateUtil.formatDateMs(songDuration.toInt(), format: "mm:ss");

          return renderChild(
              currentTime: currentTime,
              songDuration: songDuration,
              currentTimeStr: currentTimeStr,
              songDurationStr: songDurationStr);
        });
  }
}
