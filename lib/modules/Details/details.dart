import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/modules/Details/view_models/details_provider.dart';
import 'package:streamz/shared/margin.dart';
import 'package:streamz/shared/pop_appbar.dart';

import '../../core/core.dart';
import '../../core/services/storage_service.dart';
import '../../locator.dart';

StorageService storageService = getIt<StorageService>();

// ignore: must_be_immutable
class Details extends StatelessWidget {
  final StreamModel stream;
  Details({
    required this.stream,
    Key? key,
  }) : super(key: key);

  bool hasDownloaded = false;

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
                          onPressed: () async {
                            String file = await storageService
                                .readItem(key: stream.title!)
                                .then((value) {
                              if (value != null) {
                                hasDownloaded = true;
                                return value;
                              } else {
                                hasDownloaded = false;
                                return '';
                              }
                            });
                            // ignore: unnecessary_null_comparison
                            if (file.isEmpty || file == null) {
                              if (!value.isPlayingAudio) {
                                value.playAudio(stream.audioUrl!);
                              } else {
                                value.pauseAudio();
                              }
                            } else {
                              if (!value.isPlayingAudio) {
                                value.playDownloadedAudio(File(file));
                              } else {
                                value.pauseAudio();
                              }
                            }
                            log('hasDownloaded: $hasDownloaded');
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
                      !value.isDownloading
                          ? IconButton(
                              onPressed: () {
                                value.downloadFile(
                                    stream.audioUrl!, stream.title!);
                              },
                              icon: Icon(
                                Icons.download,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            )
                          : const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
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
