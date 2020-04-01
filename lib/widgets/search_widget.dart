import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({this.onSubmitted, this.controller});
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.white,
        controller: controller,
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        style: Theme.of(context).primaryTextTheme.body1,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: Theme.of(context).primaryTextTheme.body1,
            hintText: '请输入请搜搜索关键字'));
  }
}
