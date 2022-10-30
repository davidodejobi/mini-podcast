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
          FutureBuilder(
              future: Future.delayed(const Duration(seconds: 0)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    //TODO change this to a shimmer loading
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.error != null) {
                    return const Center(
                      child: Text("An error occurred!"),
                    );
                  } else {
                    return Consumer<DashboardProvider>(
                      builder: (context, dashboardProvider, child) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const Details(),
                                ),
                              );
                            },
                            child: const ItemCard());
                      },
                    );
                  }
                }
              }).paddingHorizontal(padding: 16),
          Container(
            padding: const EdgeInsets.only(right: 16),
            height: 65,
            child: Column(
              children: [
                Container(
                  height: 5,
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
                      style: Theme.of(context).textTheme.headline4!.copyWith(
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).glassmorphism(),
        ],
      ),
    );
  }
}
