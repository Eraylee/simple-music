import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback onPressed;

  NetErrorWidget({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: Application.screen.getHeight(200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: Application.screen.getHeight(80),
            ),
            EmptyView(height: Application.screen.getHeight(10)),
            Text(
              '点击重新请求',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
