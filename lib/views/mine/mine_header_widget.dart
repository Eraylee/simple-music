import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/widgets/empty_view_widget.dart';

class MineHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel userModel, _) {
        return Container(
          width: Application.screen.screenWidth,
          height: Application.screen.getHeight(90),
          decoration: userModel.user != null
              ? BoxDecoration(
                  image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(userModel.user?.profile?.backgroundUrl),
                ))
              : BoxDecoration(color: Colors.transparent),
          child: userModel.user != null
              ? Container(
                  color: Colors.black26,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: Image.network(
                          userModel.user.profile.avatarUrl,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      EmptyView(
                        height: 8,
                      ),
                      Text(
                        userModel.user.profile.nickname,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  )),
                )
              : Center(
                  child: RaisedButton(
                    onPressed: () => NavigatorUtil.goLoginPage(context),
                    child: Text('立即登录'),
                  ),
                ),
        );
      },
    );
  }
}
