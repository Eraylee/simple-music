import 'dart:convert' show json;

import 'package:simple_music/entities/playlist.dart';
import 'package:simple_music/entities/songDetail.dart';

class SearchResultData {
  SearchResult result;
  int code;

  SearchResultData({
    this.result,
    this.code,
  });

  factory SearchResultData.fromJson(jsonRes) => jsonRes == null
      ? null
      : SearchResultData(
          result: SearchResult.fromJson(jsonRes['result']),
          code: jsonRes['code'],
        );
  Map<String, dynamic> toJson() => {
        'result': result,
        'code': code,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class SearchResult {
  List<OrignalSong> songs;
  int songCount;
  List<Album> albums;
  int albumCount;
  List<Artists> artists;
  int artistCount;
  List<Playlist> playlists;
  int playlistCount;

  SearchResult({
    this.songs,
    this.songCount,
    this.albums,
    this.albumCount,
    this.artistCount,
    this.artists,
    this.playlists,
    this.playlistCount,
  });
  factory SearchResult.init() {
    return SearchResult(
        songs: [],
        songCount: 0,
        albums: [],
        albumCount: 0,
        artistCount: 0,
        artists: [],
        playlists: [],
        playlistCount: 0);
  }

  factory SearchResult.fromJson(jsonRes) {
    if (jsonRes == null) return null;
    List<OrignalSong> songs = jsonRes['songs'] is List ? [] : null;
    if (songs != null) {
      for (var item in jsonRes['songs']) {
        if (item != null) {
          songs.add(OrignalSong.fromJson(item));
        }
      }
    }

    List<Album> albums = jsonRes['albums'] is List ? [] : null;
    if (albums != null) {
      for (var item in jsonRes['albums']) {
        if (item != null) {
          albums.add(Album.fromJson(item));
        }
      }
    }
    List<Artists> artists = jsonRes['artists'] is List ? [] : null;
    if (artists != null) {
      for (var item in jsonRes['artists']) {
        if (item != null) {
          artists.add(Artists.fromJson(item));
        }
      }
    }
    List<Playlist> playlists = jsonRes['playlists'] is List ? [] : null;
    if (playlists != null) {
      for (var item in jsonRes['playlists']) {
        if (item != null) {
          playlists.add(Playlist.fromJson(item));
        }
      }
    }
    return SearchResult(
        songs: songs,
        songCount: jsonRes['songCount'],
        albums: albums,
        albumCount: jsonRes['albumCount'],
        artistCount: jsonRes['artistCount'],
        artists: artists,
        playlists: playlists,
        playlistCount: jsonRes['playlistCount']);
  }
  Map<String, dynamic> toJson() => {
        'songs': songs,
        'songCount': songCount,
        'albums': albums,
        'albumCount': albumCount,
        'artistCount': artistCount,
        'artists': artists,
        'playlists': playlists,
        'playlistCount': playlistCount,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
