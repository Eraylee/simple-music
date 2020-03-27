import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/utils/utils..dart';
import 'package:simple_music/views/player/lyric_widget.dart';

class LyricView extends StatefulWidget {
  LyricView({this.model});
  final PlayerModel model;

  @override
  LyricState createState() => LyricState();
}

class LyricState extends State<LyricView> with TickerProviderStateMixin {
  int _currrentIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      widget.model.songPosition.listen((data) {
        if (widget.model.lyric.isNotEmpty) {
          int index =
              Utils.getCurrentIndex(data.inMilliseconds, widget.model.lyric);
          if (_currrentIndex != index) {
            _currrentIndex = index;
            _currentLineStreamController.add(index);
          }
        }
      });
    });
  }

  Animation<double> animation;
  AnimationController _animationController;
  StreamController _offsetYStreamController =
      StreamController<double>.broadcast();
  StreamController _currentLineStreamController =
      StreamController<int>.broadcast();
  double _getOffsetY(int currrentIndex) {
    return 42.0 * (currrentIndex + 1);
  }

  void _startAnmation(int currrentIndex) {
    if (_animationController != null) {
      _animationController.stop();
    }

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.dispose();
              _animationController = null;
            }
          });
    animation = Tween<double>(
            begin: -_getOffsetY(currrentIndex - 1),
            end: -_getOffsetY(currrentIndex))
        .animate(_animationController);
    _animationController.addListener(() {
      _offsetYStreamController.add(animation.value);
    });
    // 启动动画
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    if (_animationController != null) {
      _animationController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.model.nolyric) {
      return Center(
        child: Text(
          '纯音乐，暂无歌词',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }
    if (widget.model.lyric.isEmpty) {
      return Center(
        child: Text(
          '正在获取歌词...',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }
    print('widget.model.nolyric ${widget.model.nolyric}');

    return StreamBuilder<int>(
        stream: _currentLineStreamController.stream,
        builder: (BuildContext context, indexSnapshot) {
          ///开启动画
          if (indexSnapshot.hasData) {
            _startAnmation(indexSnapshot.data);
          }

          return StreamBuilder<double>(
              stream: _offsetYStreamController.stream,
              builder: (BuildContext context, snapshot) {
                return CustomPaint(
                    size: Size(
                        Application.screen.screenWidth,
                        Application.screen.getHeight(
                            Application.screen.screenHeight -
                                Application.screen.appBarHeight -
                                100)),
                    painter: LyricWidget(
                        lyrics: widget.model.lyric,
                        currrentIndex: indexSnapshot.data,
                        offsetY: snapshot?.data ?? 0));
              });
        });
  }
}
