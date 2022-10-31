import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/core.dart';

class DashboardProvider with ChangeNotifier {
  final Dio _dio = Dio();

  DashboardProvider() {
    audio();
  }

  audio() {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) => {
          _isPlayingAudio = state == PlayerState.playing,
          notifyListeners(),
        });

    _audioPlayer.onDurationChanged.listen((Duration d) {
      _duration = d;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      _position = p;
      notifyListeners();
    });
  }

  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isPlayingAudio => _isPlayingAudio;
  Duration get duration => _duration;
  Duration get position => _position;
  bool get bottomActionAct => _bottomActionAct;
  String get imageUrl => _imageUrl;
  String get title => _title;
  String get songUrl => _songUrl;
  List<bool> get getTracker => _tracker;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlayingAudio = false;
  final _audioPlayer = AudioPlayer();
  bool _bottomActionAct = false;
  String _imageUrl = '';
  String _title = '';
  String _songUrl = '';
  List<bool> _tracker = [];

  toggleTracker(index) {
    log('_trackerrrrrrrr: $_tracker');
    _tracker[index] = !_tracker[index];
    log('_tracker: $_tracker');
    notifyListeners();
  }

  avtivateBottomAction() {
    _bottomActionAct = true;
    notifyListeners();
  }

  getCurrentFileDetails({String? imageUrl, String? title, String? songUrl}) {
    _imageUrl = imageUrl!;
    _title = title!;
    _songUrl = songUrl!;
    notifyListeners();
  }

  playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
    notifyListeners();
  }

  pauseAudio() async {
    await audioPlayer.pause();
    notifyListeners();
  }

  stopAudio() async {
    await audioPlayer.stop();
    notifyListeners();
  }

  seekAudio(Duration duration) async {
    await audioPlayer.seek(duration);

    await audioPlayer.resume();
    notifyListeners();
  }

  final List<StreamModel> _streams = [];
  List<StreamModel> get streams => _streams;

  Future getFiles() async {
    Response userData = await _dio.get('$baseUrl/media-list');
    _streams.clear();
    for (var i = 0; i < userData.data.length; i++) {
      _streams.add(StreamModel.fromJson(userData.data[i]));
    }
    _tracker = List.filled(_streams.length, false);

    return streamModelFromJson(userData.data);
  }
}
