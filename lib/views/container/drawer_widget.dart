import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';

class MyDrawer extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Consumer<UserModel>(
            builder: (context, UserModel userModel, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: userModel.user != null
                  ? <Widget>[
                      ClipOval(
                        child: Image.network(
                          userModel.user.profile.avatarUrl,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      EmptyView(
                        height: 4,
                      ),
                      Text(
                        userModel.user.profile.nickname,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ]
                  : <Widget>[
                      RaisedButton(
                        onPressed: () => NavigatorUtil.goLoginPage(context),
                        child: Text('立即登录'),
                      )
                    ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Consumer<UserModel>(
                builder: (context, UserModel userModel, child) =>
                    userModel.user != null
                        ? RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            onPressed: () => userModel.logout(),
                            child: Text(
                              '退出账号',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Container())
          ],
        )
      ],
    ));
  }
}
