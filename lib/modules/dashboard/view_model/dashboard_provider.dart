import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:streamz/core/models/stream_model.dart';

enum LoadingState {
  loading,
  loaded,
  error,
}

class DashboardProvider with ChangeNotifier {
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlayingAudio = false;
  // bool _hasStoppedAudio = false;
  final _audioPlayer = AudioPlayer();

  DashboardProvider() {
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
  }

  bool _isPlaying = false;

  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isPlayingAudio => _isPlayingAudio;
  Duration get duration => _duration;
  Duration get position => _position;
  bool get isPlaying => _isPlaying;

  play() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  pause() {
    _audioPlayer.pause();
    notifyListeners();
  }

  resume() {
    _audioPlayer.resume();
    notifyListeners();
  }

  onCompleted() {
    _isPlaying = false;
    notifyListeners();
  }

  final List<StreamModel> _streams = [];
  LoadingState loadingState = LoadingState.loading;

  Future getGettings() async {
    loadingState = LoadingState.loading;
    notifyListeners();

    try {
      // Response data = connect().get('/media-list');
      // var response = streamModelFromJson(data.body);
      // for (var item in response) {
      //   _streams.add(item);
      // }\
      Future.delayed(const Duration(seconds: 5)).then((value) {
        loadingState = LoadingState.loaded;
        log('I got here');
      });
      // print('_streams: $_streams');
      notifyListeners();
    } on Exception catch (e) {
      loadingState = LoadingState.error;
      notifyListeners();
      print(e);
    }
  }
}
