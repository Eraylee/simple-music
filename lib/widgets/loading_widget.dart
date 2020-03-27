import 'package:flutter/material.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: BallPulseIndicator(
        maxRadius: 5,
        ballColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
