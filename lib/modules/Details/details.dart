import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:streamz/constant/helper/helper.dart';
import 'package:streamz/shared/margin.dart';
import 'package:streamz/shared/pop_appbar.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: popAppBar(context, title: 'Details'),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
          ).paddingHorizontal(padding: 16),
          const YMargin(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Take me to church',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      height: 0.5,
                      fontSize: 26,
                    ),
              ),
              const XMargin(5),
              Text(
                '(2342)',
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
          const YMargin(10),
          Expanded(
            child: SizedBox(
              child: Text(
                """You may have heard of the three shepherds who went, but I am not sure that you have heard of the shepherd who didn't go. But I have heard of it and I have brought it to you.""",
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
                      '00:00',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '00:00',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                const YMargin(10),
                Slider(
                  value: 0,
                  min: 0,
                  // label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    // setState(() {
                    //   _currentSliderValue = value;
                    // });
                  },
                ),
                const YMargin(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const XMargin(50),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xFFEE6C4D),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow_rounded,
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
              ],
            ),
          ).paddingBottom(padding: 30)
        ],
      ).paddingHorizontal(padding: 16),
    );
  }
}
