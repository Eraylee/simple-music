import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_music/widgets/player_widget.dart';

class CommonDetailHeaderWidget extends StatelessWidget {
  CommonDetailHeaderWidget(
      {this.title,
      this.cover,
      @required this.body,
      this.content,
      @required this.expandedHeight});
  final String title;
  final String cover;
  final double expandedHeight;
  final Widget body;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 52),
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                expandedHeight: expandedHeight,
                forceElevated: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  title: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: cover != null
                      ? Stack(
                          children: <Widget>[
                            Container(
                              color: Theme.of(context).primaryColor,
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           fit: BoxFit.cover,
                            //           image: NetworkImage(
                            //             cover,
                            //           ))),
                            // ),
                            // BackdropFilter(
                            //   filter: ImageFilter.blur(
                            //       sigmaX: 200.0,
                            //       sigmaY: 200.0), //图片模糊过滤，横向竖向都设置5.0
                            //   child: Container(
                            //     color: Colors.black12,
                            //     width: double.infinity,
                            //     height: double.infinity,
                            //   ),
                            // ),
                            content ?? Container(),
                          ],
                        )
                      : Container(
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(14),
                sliver: body,
              ),
            ]),
          ),
          PlayerWidget()
        ],
      ),
    );
  }
}
