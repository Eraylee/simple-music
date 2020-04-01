import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:simple_music/application.dart';
import 'package:simple_music/entities/common.dart';
import 'package:simple_music/entities/likedList.dart';

import 'package:simple_music/entities/song.dart';
import 'package:simple_music/api/api.dart';
import 'package:simple_music/entities/lyric.dart';
import 'package:simple_music/utils/utils..dart';

export 'package:audioplayers/audioplayers.dart' show AudioPlayerState;

enum PlayMode {
  repeat,
  repeatOne,
}

class PlayerModel with ChangeNotifier {
  PlayerModel() {
    ///播放状态
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _playState = state;
      if (state == AudioPlayerState.COMPLETED) {
        /// 如果是单曲循环
        if (_playMode == PlayMode.repeat) {
          stop();
          play();
        } else {
          playNext();
        }
      }
      notifyListeners();
    });

    /// 歌曲总进度
    _audioPlayer.onDurationChanged.listen((Duration d) {
      _songDuration = d;
    });

    ///播放进度5
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      changeProgress(p.inMilliseconds > _songDuration.inMilliseconds
          ? _songDuration.inMilliseconds
          : p.inMilliseconds);
    });

    _currentIndex = Application.sp.getInt('current_index') ?? -1;
    int playModeKey = Application.sp.get('playModeKey') ?? 0;
    _playMode = PlayMode.values[playModeKey];
    print(
        'Application.sp.getStringList("play_list) ${Application.sp.getStringList('play_list')}');
    if (Application.sp.containsKey('play_list')) {
      List<Song> songs = Application.sp
          .getStringList('play_list')
          .map((v) => Song.fromJson(json.decode(v)))
          .toList();
      _addMusicToPlaylist(songs);
    }
  }
  StreamController<Duration> _streamController =
      StreamController<Duration>.broadcast();

  /// 播放器实例
  AudioPlayer _audioPlayer = AudioPlayer();

  /// 播放列表
  List<Song> _playList = [];

  /// 当前歌曲下标
  int _currentIndex = -1;

  /// 当前播放状态
  AudioPlayerState _playState;

  /// 歌曲总时间
  Duration _songDuration;

  ///歌词
  List<Lyric> lyric = [];
  List<int> _likedList = [];
  bool _nolyric = false;
  PlayMode _playMode;
  int _uid;
  bool get nolyric => _nolyric;
  PlayMode get playMode => _playMode;
  bool get isFavorite => likedList.contains(song.id);
  List<int> get likedList => _likedList;
  List<Lyric> get user => lyric;

  List<Song> get playList => _playList;
  Song get song => _currentIndex >= 0 ? _playList[_currentIndex] : null;
  int get currentIndex => _currentIndex;
  AudioPlayerState get playState => _playState;
  Duration get songDuration => _songDuration;
  Stream<Duration> get songPosition => _streamController.stream;

  /// 控制播放进度
  void changeProgress(int milliseconds) {
    _streamController.add(Duration(milliseconds: milliseconds));
  }

  /// 跳转到固定时间
  void seek(int milliseconds) {
    _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resume();
  }

  void toggle() {
    if (_playState == AudioPlayerState.PLAYING) {
      pause();
    } else {
      play();
    }
  }

  // 播放一首歌
  void playSong(Song song) {
    int index = _playList.indexOf(song);
    if (index < 0) {
      _playList.insert(0, song);
    } else {
      _currentIndex = index;
    }
    play();
  }

  /// 添加歌曲
  void add(List<Song> songs) {
    _addMusicToPlaylist(songs);
  }

  /// 播放
  void play() {
    try {
      _audioPlayer
          .play("https://music.163.com/song/media/outer/url?id=${song.id}.mp3");
      _saveCurSong();
    } catch (e) {
      print(
          '播放歌曲链接： https://music.163.com/song/media/outer/url?id=${song.id}.mp3 错误，错误原因： ${e.toString()}');
    }
  }

  /// 暂停
  void pause() {
    _audioPlayer.pause();
  }

  /// 恢复播放
  void resume() {
    _audioPlayer.resume();
  }

  /// 移除歌曲
  void remove(int index) {
    _playList.removeAt(index);
    if (_playList.length > 1) {
      if (index < _currentIndex) {
        _currentIndex--;
      } else if (index == _currentIndex) {
        _currentIndex = 0;
        play();
      }
    } else {
      _currentIndex = -1;
      stop();
    }
    notifyListeners();
  }

  // 保存当前歌曲到本地
  void _saveCurSong() {
    Application.sp.remove('play_list');
    Application.sp.setStringList(
        'play_list', _playList.map((v) => json.encode(v.toJson())).toList());
    Application.sp.setInt('current_index', _currentIndex);
  }

  /// 添加并且播放
  void addAndPlay(List<Song> songs, int index) {
    _currentIndex = index;
    _addMusicToPlaylist(songs, false);
    play();
  }

  /// 下一曲
  void playNext() {
    if (_currentIndex >= _playList.length - 1) {
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }
    play();
    getLyric();
  }

  /// 停止播放
  void stop() {
    _audioPlayer.stop();
  }

  ///上一曲
  void playPrev() {
    if (_currentIndex <= 0) {
      _currentIndex = _playList.length - 1;
    } else {
      _currentIndex--;
    }
    play();
    getLyric();
  }

  /// 添加歌曲之前清空列表
  _addMusicToPlaylist(List<Song> songs, [bool needSave = true]) {
    _playList.clear();
    _playList.addAll(songs);
    if (needSave) {
      _saveCurSong();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
    _streamController.close();
  }

  void getLyric() async {
    lyric = [];
    try {
      LyricData res = await Api.getLyric(song.id);
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '获取歌词失败');
      }
      if (res.nolyric == true) {
        _nolyric = true;
      } else {
        lyric = Utils.formatLyric(res.lrc.lyric);
      }
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }

  void clearList() {
    _playList = [];
    _currentIndex = -1;
    notifyListeners();
    _saveCurSong();
  }

  void getLikedList([uid]) async {
    try {
      if (uid != null) {
        _uid = uid;
      }

      LikedListData res = await Api.getLikedList(_uid);
      if (res.code > 299) {
        Utils.showToast(res.msg ?? '获取喜欢列表失败');
      }
      _likedList = res.ids;
      notifyListeners();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }

  void changePlayMode() {
    _playMode =
        _playMode == PlayMode.repeat ? PlayMode.repeatOne : PlayMode.repeat;
    Application.sp.setInt('playModeKey', _playMode.index);
    notifyListeners();
  }

  void toggleLiked() async {
    try {
      Common res = await Api.addLikeList(song.id, !isFavorite);
      if (res.code > 299) {
        Utils.showToast(res.msg);
      }
      getLikedList();
    } catch (e) {
      print('errors ${e.toString()}');
    }
  }
}
