import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';

class AlbumArtWidget extends StatelessWidget {
  AlbumArtWidget({Key key, this.cover}) : super(key: key);
  final String cover;
  @override
  Widget build(BuildContext context) {
    final double _albumArtSize = Application.screen.screenWidth * 0.8;
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 20.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
            )
      ]),
      child: Image.network(
        cover,
        width: _albumArtSize,
        height: _albumArtSize,
        fit: BoxFit.cover,
      ),
    );
  }
}
