import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:simple_music/api/api.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/utils/utils..dart';
import 'package:simple_music/entities/user.dart';
import 'package:simple_music/entities/common.dart';

class UserModel with ChangeNotifier {
  User _user;
  bool _disabled = false;
  User get user => _user;
  bool get disabled => _disabled;

  /// 初始化 User
  UserModel() {
    if (Application.sp.containsKey('user')) {
      _user = User.fromJson(json.decode(Application.sp.getString('user')));
    }
  }

  Future login(String phone, String password) async {
    _disabled = true;
    try {
      User res = await Api.loginByPhoneAndPassWord(phone, password);
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '登录失败，请检查账号密码');
        return null;
      }
      Utils.showToast('登录成功');
      _saveUserInfo(res);
      _disabled = false;
      notifyListeners();

      return res;
    } catch (e) {
      Utils.showToast(e.toString() ?? '登录失败，服务器错误');
      _disabled = false;
      print('errors ${e.toString()}');
    }
  }

  Future logout() async {
    try {
      Common res = await Api.logout();
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '注销失败');
        return null;
      }
      Utils.showToast('注销登录成功');
      _removeUserInfo();
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }

  /// 保存用户信息到 本地
  _saveUserInfo(User user) {
    _user = user;
    Application.sp.setString('user', json.encode(_user.toJson()));
  }

  /// 清除用户信息
  _removeUserInfo() {
    _user = null;
    Application.sp.remove('user');
  }
}
