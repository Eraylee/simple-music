import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/widgets/loading_widget.dart';
import 'package:simple_music/widgets/net_error_wiget.dart';

typedef ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class SliverFutureBuilderWidget<T> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final Future<T> future;

  SliverFutureBuilderWidget({
    @required this.future,
    @required this.builder,
  });

  @override
  CustomFutureBuilderState<T> createState() => CustomFutureBuilderState<T>();
}

class CustomFutureBuilderState<T> extends State<SliverFutureBuilderWidget<T>> {
  Future<T> _future;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _request();
    });
  }

  void _request() {
    setState(() {
      _future = widget.future;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _future == null
        ? SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: Application.screen.getHeight(200),
              child: CupertinoActivityIndicator(),
            ),
          )
        : FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return SliverToBoxAdapter(
                    child: Container(
                      alignment: Alignment.center,
                      height: Application.screen.getHeight(200),
                      child: LoadingWidget(),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return widget.builder(context, snapshot.data);
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: NetErrorWidget(
                        onPressed: _request,
                      ),
                    );
                  }
              }
              return Container();
            },
          );
  }
}
