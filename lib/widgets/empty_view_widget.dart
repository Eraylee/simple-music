import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';

class EmptyView extends StatelessWidget {
  EmptyView({this.width = 0, this.height = 0});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Application.screen.getWidth(width),
        height: Application.screen.getWidth(height));
  }
}
