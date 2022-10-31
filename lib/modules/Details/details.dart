import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/modules/Details/view_models/details_provider.dart';
import 'package:streamz/shared/margin.dart';
import 'package:streamz/shared/pop_appbar.dart';

import '../../core/core.dart';

class Details extends StatelessWidget {
  final StreamModel stream;
  const Details({
    required this.stream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailsProvider>(context);
    return Scaffold(
      appBar: popAppBar(context, title: 'Details'),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: stream.imageUrl!,
              child: CachedNetworkImage(
                imageUrl: stream.imageUrl!,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
              ),
            ),
          ),
          const YMargin(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stream.title!,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    // height: 0.5,
                    fontSize: 26,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const YMargin(5),
          Text(
            '(${stream.year})',
            style: Theme.of(context).textTheme.headline5,
          ),
          const YMargin(10),
          Expanded(
            child: SizedBox(
              child: Text(
                stream.description!,
                textAlign: TextAlign.center,
                maxLines: 10,
                style: Theme.of(context).textTheme.headline4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(provider.position),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      formatTime(provider.duration - provider.position),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const YMargin(10),
                Slider(
                  min: 0,
                  max: provider.duration.inSeconds.toDouble(),
                  value: provider.position.inSeconds.toDouble(),
                  onChanged: (double value) {
                    final Duration newDuration =
                        Duration(seconds: value.toInt());
                    provider.seekAudio(newDuration);
                  },
                ),
                const YMargin(10),
                Consumer<DetailsProvider>(
                  builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const XMargin(50),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFEE6C4D),
                        child: IconButton(
                          onPressed: () {
                            value.audio();

                            if (!value.isPlayingAudio) {
                              value.playAudio(stream.audioUrl!);
                            } else {
                              value.pauseAudio();
                            }
                          },
                          icon: Icon(
                            !value.isPlayingAudio
                                ? Icons.play_arrow_rounded
                                : Icons.pause,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.download,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingBottom(padding: 30)
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
