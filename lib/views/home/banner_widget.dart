import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:simple_music/application.dart';

import 'package:simple_music/entities/banner.dart' as MyBanner;

class BannerWidget extends StatelessWidget {
  BannerWidget({Key key, this.list = const []}) : super(key: key);
  final List<MyBanner.Banner> list;
  final double _height = Application.screen.screenWidth * 7 / 18 + 20;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: _height,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return list.isNotEmpty
                  ? Image.network(
                      list[index].pic,
                      fit: BoxFit.fill,
                      key: UniqueKey(),
                    )
                  : Container(
                      color: Theme.of(context).backgroundColor,
                      child: Center(
                        child: Text('无数据'),
                      ),
                      key: UniqueKey(),
                    );
            },
            autoplay: true,
            itemCount: list.isNotEmpty ? list.length : 2,
            pagination: SwiperPagination(),
            viewportFraction: 0.8,
            scale: 0.9,
            controller: SwiperController(),
          ),
        ));
  }
}
