import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/lyric.dart';

class LyricWidget extends CustomPainter {
  LyricWidget({this.lyrics, this.offsetY, this.currrentIndex});
  final List<Lyric> lyrics;
  double offsetY;
  int currrentIndex;
  @override
  paint(Canvas canvas, Size size) {
    double y = offsetY + size.height / 2;
    lyrics.asMap().forEach((int i, lyric) {
      if (y < size.height && y > Application.screen.appBarHeight) {
        TextPainter textPainter;
        if (currrentIndex == i) {
          textPainter = TextPainter(
              text: TextSpan(
                  text: lyric.lyric, style: TextStyle(color: Colors.white)),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center);
        } else {
          textPainter = TextPainter(
              text: TextSpan(
                  text: lyric.lyric, style: TextStyle(color: Colors.white60)),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center);
        }
        textPainter.layout(
            maxWidth: Application.screen.screenWidth,
            minWidth: Application.screen.screenWidth);
        textPainter.paint(
          canvas,
          Offset(0, y),
        );
      }
      y += 42;
    });
  }

  @override
  bool shouldRepaint(LyricWidget oldDelegate) {
    return oldDelegate.offsetY != offsetY;
  }
}
