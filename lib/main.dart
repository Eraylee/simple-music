import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';

import 'package:simple_music/models/home.dart';
import 'package:simple_music/models/mine.dart';
import 'package:simple_music/models/search.dart';
import 'package:simple_music/models/user.dart';
import 'package:simple_music/models/player.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  // 强制竖屏
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
      ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
      ChangeNotifierProvider<PlayerModel>(create: (_) => PlayerModel()),
      ChangeNotifierProvider<MineModel>(create: (_) => MineModel()),
      ChangeNotifierProvider<SearchModel>(create: (_) => SearchModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Music',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
