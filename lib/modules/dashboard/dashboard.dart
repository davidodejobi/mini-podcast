import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/modules/Details/details.dart';

import '../../shared/shared.dart';
import 'view_model/dashboard_provider.dart';
import 'widgets/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("Streamz", context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FutureBuilder(
                    future:
                        Provider.of<DashboardProvider>(context, listen: false)
                            .getFiles(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.separated(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return DashboardShimmer();
                          },
                          separatorBuilder: (context, index) {
                            return const YMargin(16);
                          },
                        );
                      } else {
                        if (snapshot.error == null) {
                          return const Center(
                            child: Text("An error occurred!"),
                          );
                        } else {
                          return Consumer<DashboardProvider>(
                            builder: (context, dashboardProvider, child) {
                              return ListView.separated(
                                itemCount: dashboardProvider.streams.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      dashboardProvider.stopAudio();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Details(
                                            stream: dashboardProvider
                                                .streams[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: ItemCard(
                                      stream: dashboardProvider.streams[index],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const YMargin(16);
                                },
                              );
                            },
                          );
                        }
                      }
                    }),
              ),
            ),
          ),
          Consumer<DashboardProvider>(
            builder: (context, dbProvider, child) {
              return SizedBox(
                height: 65,
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
                          imageUrl:
                              "https://storage.googleapis.com/me-samples-public-2/some-animal-friends-in-africa.png",
                          height: 60,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const XMargin(5),
                        Text(
                          "Doctor Strange",
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                            color: Color(0xFFEE6C4D),
                          ).paddingRight,
                        ),
                      ],
                    ),
                  ],
                ),
              ).glassmorphism();
            },
          ),
        ],
      ),
    );
  }
}
