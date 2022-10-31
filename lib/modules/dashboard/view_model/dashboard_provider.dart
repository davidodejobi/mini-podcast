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
  bool get isPlaying => _isPlaying;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlayingAudio = false;
  final _audioPlayer = AudioPlayer();
  final bool _isPlaying = false;

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
  // AudioPlayer get audioPlayer => _audioPlayer;
  // bool get isPlayingAudio => _isPlayingAudio;
  // Duration get duration => _duration;
  // Duration get position => _position;
  // bool get isPlaying => _isPlaying;

  // Duration _duration = Duration.zero;
  // Duration _position = Duration.zero;
  // bool _isPlayingAudio = false;
  // final _audioPlayer = AudioPlayer();
  // bool _isPlaying = false;
  // // bool _hasStoppedAudio = false;

  // DashboardProvider() {
  //   audio() {
  //     _audioPlayer.onPlayerStateChanged.listen((PlayerState state) => {
  //           _isPlayingAudio = state == PlayerState.playing,
  //           notifyListeners(),
  //         });

  //     _audioPlayer.onDurationChanged.listen((Duration d) {
  //       _duration = d;
  //       notifyListeners();
  //     });

  //     _audioPlayer.onPositionChanged.listen((Duration p) {
  //       _position = p;
  //       notifyListeners();
  //     });
  //   }
  // }

  // play() {
  //   _isPlaying = !_isPlaying;
  //   notifyListeners();
  // }

  // pause() {
  //   _audioPlayer.pause();
  //   notifyListeners();
  // }

  // resume() {
  //   _audioPlayer.resume();
  //   notifyListeners();
  // }

  // onCompleted() {
  //   _isPlaying = false;
  //   notifyListeners();
  // }

  final List<StreamModel> _streams = [];
  List<StreamModel> get streams => _streams;

  Future getFiles() async {
    Response userData = await _dio.get('$baseUrl/media-list');
    _streams.clear();
    for (var i = 0; i < userData.data.length; i++) {
      _streams.add(StreamModel.fromJson(userData.data[i]));
    }

    return streamModelFromJson(userData.data);
  }
}
