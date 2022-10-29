import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';

import '../../core/core.dart';
import '../../shared/shared.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("Streamz", context),
      body: ListView(
        children: [
          Container(
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
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "1880",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      /*
Text(
              content!.length > 150
                  ? "${content!.substring(0, 150)}..."
                  : content!,
              style: Theme.of(context).textTheme.headline5,
            ),
                      */
                      const Spacer(),
                      Text(
                        "You may have heard of the three shepherds who went...",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ).paddingAll,
                ),
                Consumer<StreamzTheme>(
                  builder: (context, notifier, child) => Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 30,
                        color: notifier.isDarkTheme
                            ? const Color(0xFFCF6679)
                            : const Color(0xFFB00020),
                      ),
                      onPressed: () {},
                      tooltip: 'Play ',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
