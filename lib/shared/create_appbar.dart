import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/utils/utils.dart';
import 'widgets/appbar_card_wih_icon.dart';

PreferredSizeWidget createAppBar(
  String title,
  BuildContext context,
) {
  var notifier = Provider.of<StreamzTheme>(context);
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: SafeArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarCardwithIcon(
                iconButton: IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {},
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: notifier.isDarkTheme
                      ? Icon(
                          Icons.wb_sunny,
                          size: 20,
                          color: Theme.of(context).iconTheme.color,
                        )
                      : Icon(
                          Icons.nightlight,
                          size: 20,
                          color: Theme.of(context).iconTheme.color,
                        ),
                  onPressed: () => notifier.toggleTheme(),
                  tooltip: 'Change note color',
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
