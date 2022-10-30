import 'package:flutter/material.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'dart:math' as math;

// generate random width
final random = math.Random();

class DashboardShimmer extends StatelessWidget {
  DashboardShimmer({
    Key? key,
  }) : super(key: key);

  final randomWidth1 = random.nextInt(200) + 70.toDouble();
  final randomWidth2 = random.nextInt(50) + 30.toDouble();
  final randomWidth3 = random.nextInt(200) + 159.toDouble();
  final randomWidth4 = random.nextInt(200) + 100.toDouble();
  final randomWidth5 = random.nextInt(200) + 50.toDouble();
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
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            height: 120,
            width: 100,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: randomWidth1,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 5),
                Container(
                  height: 16,
                  width: randomWidth2,
                  color: Colors.grey.shade400,
                ),
                const Spacer(),
                Container(
                  height: 10,
                  width: randomWidth3,
                  color: Colors.grey.shade400,
                ),
                Container(
                  width: randomWidth4,
                  height: 10,
                  color: Colors.grey.shade400,
                ).paddingVertical(padding: 2),
                Container(
                  width: randomWidth5,
                  height: 10,
                  color: Colors.grey.shade400,
                ),
              ],
            ).paddingAll,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              size: 30,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
