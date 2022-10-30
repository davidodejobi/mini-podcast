import 'package:flutter/material.dart';

extension AppPadding on Widget {
  Widget get paddingRight => Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: this,
      );

  Widget get paddingLeft => Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: this,
      );

  paddingBottom({double padding = 10.0}) => Padding(
        padding: EdgeInsets.only(
          bottom: padding,
        ),
        child: this,
      );

  paddingHorizontal({double padding = 10.0}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: this,
      );

  paddingVertical({double padding = 10.0}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: padding,
        ),
        child: this,
      );

  Widget get paddingAll => Padding(
        padding: const EdgeInsets.all(10),
        child: this,
      );
}
