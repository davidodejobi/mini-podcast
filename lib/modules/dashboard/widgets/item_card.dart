import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/modules/dashboard/view_model/dashboard_provider.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  // final audioPlayer = AudioPlayer();

  // Duration _duration = Duration.zero;
  // Duration _position = Duration.zero;
  // // late PlayerState playerState;
  // late bool isPlaying = false;

  // @override
  // void initState() {
  //   super.initState();
  //   audioPlayer.onPlayerStateChanged.listen((PlayerState state) => {
  //         setState((() => isPlaying = state == PlayerState.playing)),
  //       });

  //   audioPlayer.onDurationChanged.listen((Duration d) {
  //     setState(() {
  //       _duration = d;
  //     });
  //   });

  //   audioPlayer.onPositionChanged.listen((Duration p) {
  //     setState(() {
  //       _position = p;
  //     });
  //   });
  // }

  // String formatTime(Duration duration) {
  //   String twoDigits(int n) {
  //     if (n >= 10) return "$n";
  //     return "0$n";
  //   }

  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   return "$twoDigitMinutes:$twoDigitSeconds";
  // }

  // double getAudioPercnetage(Duration position, Duration duration) {
  //   if (position.inMilliseconds > 0 && duration.inMilliseconds > 0) {
  //     return position.inMilliseconds / duration.inMilliseconds;
  //   } else {
  //     return 0.0;
  //   }
  // }

  // Container(
  //   height: 5,
  //   width: (MediaQuery.of(context).size.width - 32) *
  //       getAudioPercnetage(_position, _duration),
  //   color: const Color(0xFFE0FBFC),
  // ),
  // @override
  // void dispose() {
  //   super.dispose();
  //   audioPlayer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              "https://storage.googleapis.com/me-samples-public-2/some-animal-friends-in-africa.png",
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doctor Strange",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  "1880",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 5),
                // Text(
                //   '${getAudioPercnetage(_position, _duration)}',
                //   style: Theme.of(context).textTheme.headline5!.copyWith(
                //         fontWeight: FontWeight.w300,
                //       ),
                // ),
                // const Spacer(),
                Text(
                  "You may have heard of the three shepherds who went...",
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
              ],
            ).paddingAll,
          ),
          Consumer<DashboardProvider>(
            builder: (context, value2, child) => Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  !value2.isPlaying
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded,
                  size: 30,
                  color: const Color(0xFFEE6C4D),
                ),
                onPressed: () async {
                  if (value2.isPlayingAudio) {
                    // print("I was here");
                    if (value2.isPlaying) {
                      await value2.pause();
                    } else {
                      value2.resume();
                    }
                    value2.audioPlayer.play(UrlSource(
                        "https://storage.googleapis.com/me-samples-public-2/christmas-30-seconds.mp3"));
                  } else {}
                  value2.play();
                  value2.audioPlayer.onPlayerComplete.listen((event) {
                    value2.onCompleted();
                    // onComplete();
                    // setState(() {
                    //   _position = Duration.zero;
                    // });
                  });
                },
                tooltip: 'Play ',
              ),
            ),
          )
          // Consumer<StreamzTheme>(
          //   builder: (context, notifier, child) => Container(
          //     padding: const EdgeInsets.all(3),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.play_arrow_rounded,
          //         size: 30,
          //         color: Color(0xFFB00020),
          //       ),
          //       onPressed: () {

          //         audioPlayer.play(UrlSource(
          //             "https://storage.googleapis.com/me-samples-public-2/christmas-30-seconds.mp3"));
          //       },
          //       tooltip: 'Play ',
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
