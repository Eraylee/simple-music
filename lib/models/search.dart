import 'package:flutter/material.dart';

import 'package:simple_music/api/api.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/hotSearch.dart';

class SearchModel with ChangeNotifier {
  List<HotSearch> _hotSearchList = [];
  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;
  List<HotSearch> get hotSearchList => _hotSearchList;

  void addSearchHistory(value) {
    _hotSearchList.add(value);
    _saveSearchHistory();
  }

  void removeSearchHistory(index) {
    _hotSearchList.removeAt(index);
    _saveSearchHistory();
  }

  void _saveSearchHistory() {
    Application.sp.setStringList('search_history', _searchHistory);
  }

  void getHotSearch() async {
    try {
      HotSearchData res = await Api.getHotSearchList();
      _hotSearchList = res.data;
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }
}
