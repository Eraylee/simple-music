import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/models/user.dart';
import 'package:simple_music/utils/navigator_util.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State {
  final TextEditingController _telController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  bool _isPasswordShow = false;
  void submit() async {
    var res = await Provider.of<UserModel>(context, listen: false)
        .login(_telController.text, _passController.text);
    if (res != null) {
      NavigatorUtil.goHomePage(context);
    }
  }

  void _handlePasswordShow() {
    setState(() {
      _isPasswordShow = !_isPasswordShow;
    });
  }

  @override
  void dispose() {
    _passController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Container(
            height: 320,
            child: Card(
              margin: const EdgeInsets.all(50),
              elevation: 6,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextField(
                      controller: _telController,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        icon: new Icon(
                          Icons.phone_iphone,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _passController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          icon: new Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordShow
                                ? Icons.visibility
                                : Icons.visibility_off),
                            // 点击改变显示或隐藏密码
                            onPressed: _handlePasswordShow,
                          )),
                      obscureText: !_isPasswordShow,
                    ),
                    Consumer<UserModel>(
                      builder: (BuildContext context, UserModel userModel, _) {
                        return RaisedButton(
                          onPressed: !userModel.disabled ? submit : null,
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
