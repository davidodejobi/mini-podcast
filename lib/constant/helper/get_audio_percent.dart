double getAudioPercnetage(Duration position, Duration duration) {
  if (position.inMilliseconds > 0 && duration.inMilliseconds > 0) {
    return position.inMilliseconds / duration.inMilliseconds;
  } else {
    return 0.0;
  }
}
