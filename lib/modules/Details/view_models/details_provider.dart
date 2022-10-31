import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/services/storage_service.dart';
import '../../../locator.dart';

class DetailsProvider extends ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  DetailsProvider() {
    audio();
  }

  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isPlayingAudio => _isPlayingAudio;
  Duration get duration => _duration;
  Duration get position => _position;
  bool get isPlaying => _isPlaying;
  bool get isDownloading => _isDownloading;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlayingAudio = false;
  final _audioPlayer = AudioPlayer();
  final bool _isPlaying = false;
  bool _isDownloading = false;

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

  playDownloadedAudio(File file) {
    audioPlayer.play(
      UrlSource(file.path),
    );
    notifyListeners();
  }

  downloading() {
    _isDownloading = true;
    notifyListeners();
  }

  downloaded() {
    _isDownloading = false;
    notifyListeners();
  }

  hasDownloadedAudioPreviously(key) async {
    String file = await storageService.readItem(key: key);
    return file;
  }

  Future downloadFile(String url, String name) async {
    downloading();
    Dio dio = Dio();
    final fileName = url.split('/').last;
    try {
      var dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName');

      Response result = await dio.get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(result.data);
      await raf.close();
      log('downloaded');
      storageService.storeItem(key: name, value: file.path);
      downloaded();
      return file;
    } catch (e) {
      return null;
    }
  }
}
