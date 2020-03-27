import 'package:flutter/material.dart';

class SmallOutlineButton extends StatelessWidget {
  SmallOutlineButton(this.text, {Key key, @required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border:
              Border.all(color: Theme.of(context).primaryColorDark, width: 1)),
      child: MaterialButton(
        minWidth: 0,
        textTheme: ButtonTextTheme.accent,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
