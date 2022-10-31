import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  DetailsProvider() {
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

  playAudio(String url) async {
    await audioPlayer.play(UrlSource(url));
    notifyListeners();
  }

  pauseAudio() async {
    await audioPlayer.pause();
    notifyListeners();
  }

  seekAudio(Duration duration) async {
    await audioPlayer.seek(duration);

    await audioPlayer.resume();
    notifyListeners();
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
}
