import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/helper/helper.dart';
import '../../../shared/shared.dart';
import '../view_model/dashboard_provider.dart';

class BottomDisplay extends StatelessWidget {
  const BottomDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dbProvider, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.slowMiddle,
          height: dbProvider.bottomActionAct ? 65 : 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width) *
                    getAudioPercnetage(
                        dbProvider.position, dbProvider.duration),
                height: 2,
                color: const Color(0xFFE0FBFC),
              ),
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: dbProvider.imageUrl,
                    height: 60,
                    width: 100,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  const XMargin(5),
                  Expanded(
                    child: Text(
                      dbProvider.title,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (!dbProvider.isPlayingAudio) {
                        dbProvider.playAudio(dbProvider.songUrl);
                      } else {
                        dbProvider.pauseAudio();
                      }
                    },
                    icon: Icon(
                      !dbProvider.isPlayingAudio
                          ? Icons.play_arrow_rounded
                          : Icons.pause_rounded,
                      size: 30,
                      color: const Color(0xFFEE6C4D),
                    ).paddingRight,
                  ),
                ],
              ),
            ],
          ),
        ).glassmorphism();
      },
    );
  }
}
