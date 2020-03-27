import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_music/api/http.dart';
import 'package:simple_music/entities/hotSearch.dart';
import 'package:simple_music/models/search.dart';
import 'package:simple_music/utils/navigator_util.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/views/search/hot_search_list_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {
      Provider.of<SearchModel>(context, listen: false).getHotSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Theme(
            child: TextField(
              cursorColor: Colors.white,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: '输入搜索关键字',
                hintStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ),
            data: Theme.of(context).copyWith(primaryColor: Colors.black54),
          ),
        ),
        body: Consumer<SearchModel>(
          builder: (BuildContext context, SearchModel searchModel, _) =>
              SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HotSearchListWidget(searchModel.hotSearchList)
              ],
            ),
          ),
        ));
  }
}
