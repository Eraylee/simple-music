import 'package:flutter/material.dart';

import 'package:simple_music/api/api.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/hotSearch.dart';
import 'package:simple_music/entities/search.dart';

class SearchModel with ChangeNotifier {
  SearchModel() {
    if (Application.sp.containsKey('search_history')) {
      _searchHistory = Application.sp.getStringList('search_history');
    }
  }
  List<HotSearch> _hotSearchList = [];
  List<String> _searchHistory = [];
  SearchResult _result = SearchResult.init();
  List<String> get searchHistory => _searchHistory;
  List<HotSearch> get hotSearchList => _hotSearchList;
  SearchResult get result => _result;

  void addSearchHistory(value) {
    if (!_searchHistory.contains(value)) {
      _searchHistory.add(value);
      _saveSearchHistory();
    }
  }

  void removeSearchHistory(index) {
    _hotSearchList.removeAt(index);
    _saveSearchHistory();
  }

  void _saveSearchHistory() {
    Application.sp.setStringList('search_history', _searchHistory);
    notifyListeners();
  }

  void getHotSearch() async {
    try {
      HotSearchData res = await Api.getHotSearchList();
      _hotSearchList = res.data;
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }

  void search(String keyword,
      {SearchType type, int limit = 20, int page = 1}) async {
    try {
      SearchResultData res = await Api.getSearchResult(keyword,
          type: type, limit: limit, offset: (page - 1) * limit);
      switch (type) {
        case SearchType.album:
          _result.albums.addAll(res.result.albums);
          _result.albumCount = res.result.albumCount;
          break;
        case SearchType.artist:
          _result.artists.addAll(res.result.artists);
          _result.artistCount = res.result.artistCount;
          break;
        case SearchType.playlist:
          _result.playlists.addAll(res.result.playlists);
          _result.playlistCount = res.result.playlistCount;
          break;
        case SearchType.song:
          _result.songs.addAll(res.result.songs);
          _result.songCount = res.result.songCount;
          break;
        default:
          break;
      }
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }
}
