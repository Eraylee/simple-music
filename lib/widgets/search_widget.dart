import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({this.onSubmitted});
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        prefixStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        hintText: '输入搜索关键字',
        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
    );
  }
}
