import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
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
                            return DashboardShimmer()
                                .animate(
                                    onPlay: (controller) => controller.repeat())
                                .shimmer(
                                  curve: Curves.slowMiddle,
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.6),
                                  duration: const Duration(seconds: 1),
                                );
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
                                      index: index,
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
          const BottomDisplay(),
        ],
      ),
    );
  }
}
