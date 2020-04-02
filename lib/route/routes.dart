import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:simple_music/route/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String search = "/Search";
  static String player = "/player";
  static String searchDetail = "/searchDetail";
  static String playlistDeital = "/playlistDeital";
  static String dailyOrignalSong = "/dailyOrignalSong";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            Text('ROUTE WAS NOT FOUND !!!'));
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(player, handler: playerHandler);
    router.define(search, handler: searchHandler);
    router.define(searchDetail, handler: searchDetailHandler);
    router.define(playlistDeital, handler: playelistDetailHandler);
    router.define(dailyOrignalSong, handler: dailySongsDetailHandler);
  }
}
