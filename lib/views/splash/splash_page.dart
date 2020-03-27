import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'package:simple_music/api/http.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/application.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Http.init();
    Application.initSp();
    ScreenUtil.getInstance();
    Future.delayed(Duration(milliseconds: 2000), () {
      NavigatorUtil.goHomePage(
        context,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Center(
          child: Text(
            '欢迎体验',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ));
  }
}
