import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({Key key, @required this.icon, @required this.onPressed})
      : super(key: key);
  final Widget icon;
  final VoidCallback onPressed;

  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: onPressed,
    );
  }
}
