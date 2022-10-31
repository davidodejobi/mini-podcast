import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/core/core.dart';
import 'package:streamz/modules/dashboard/view_model/dashboard_provider.dart';

class ItemCard extends StatefulWidget {
  final StreamModel stream;
  const ItemCard({
    required this.stream,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
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
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Hero(
                tag: widget.stream.imageUrl!,
                child: CachedNetworkImage(
                  imageUrl: widget.stream.imageUrl!,
                  height: 120,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.stream.title!,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.stream.year!,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.stream.description!,
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
            builder: (context, value, child) => Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  !value.isPlayingAudio
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded,
                  size: 30,
                  color: const Color(0xFFEE6C4D),
                ),
                onPressed: () async {
                  value.audio();

                  if (!value.isPlayingAudio) {
                    value.playAudio(widget.stream.audioUrl!);
                  } else {
                    value.pauseAudio();
                  }
                },
                tooltip: 'Play ',
              ),
            ),
          )
        ],
      ),
    );
  }
}
