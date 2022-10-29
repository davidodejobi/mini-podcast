import 'package:flutter/material.dart';

class AppBarCardwithIcon extends StatelessWidget {
  const AppBarCardwithIcon({
    required this.iconButton,
    Key? key,
  }) : super(key: key);

  final Widget iconButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: iconButton,
    );
  }
}
